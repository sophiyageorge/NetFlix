import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:noteapp/data/data.dart';
import 'package:noteapp/data/note_model/note_model.dart';

enum ActionType {
  addNote,
  editNote,
}

class ScreenAddNote extends StatelessWidget {
  final ActionType type;
  String? id;
  ScreenAddNote({Key? key, required this.type, this.id}) : super(key: key);
  Widget get saveButton => TextButton.icon(
        onPressed: () {
          switch (type) {
            case ActionType.addNote:
              saveNote();
              //Navigator.of(_scaffoldKey.currentContext).pop();
              //Add Note
              break;
            case ActionType.editNote:
              saveEditNote();
              break;
          }
        },
        icon: const Icon(
          Icons.save,
          color: Colors.white,
        ),
        label: Text(
          'save',
          style: TextStyle(color: Colors.white),
        ),
      );
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    if (type == ActionType.editNote) {
      if (id == null) {
        Navigator.of(context).pop();
      }
      final note = NoteDB.instance.getNotById(id!);
      if (note == null) {
        Navigator.of(context).pop();
      }

      _titleController.text = note!.title ?? 'No Title';
      _contentController.text = note.content ?? 'No Content';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(type.name.toUpperCase()),
        actions: [
          saveButton,
        ],
      ),
      key: _scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Title',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _contentController,
                maxLines: 4,
                maxLength: 100,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Content',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveNote() async {
    final _title = _titleController.text;
    final _content = _contentController.text;

    final newNote = NoteModel.create(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _title,
      content: _content,
    );
    final _newNote = await NoteDB().createNote(newNote);
    if (_newNote != null) {
      Navigator.of(_scaffoldKey.currentContext!).pop();
    } else {
      Navigator.of(_scaffoldKey.currentContext!).pop();
    }
  }

  Future<void> saveEditNote() async {
    final _title = _titleController.text;
    final _content = _contentController.text;

    final editNote = NoteModel.create(id: id, title: _title, content: _content);

    final _note = await NoteDB.instance.updateNote(editNote);
    if (_note == null) {
      print('unable to update');
    } else {
      Navigator.of(_scaffoldKey.currentContext!).pop();
    }
  }
}
