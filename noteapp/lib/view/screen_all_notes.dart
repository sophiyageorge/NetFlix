import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:noteapp/data/note_model/note_model.dart';
import 'package:noteapp/view/screen_add_note.dart';

import '../data/data.dart';

class ScreenAllNotes extends StatelessWidget {
  ScreenAllNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await NoteDB.instance.getAllNotes();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Notes'),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: NoteDB.instance.noteListNotifier,
          builder: (context, List<NoteModel> newNotes, _) {
            if (newNotes.isEmpty) {
              return Center(
                child: Text('Note List Empty'),
              );
            }
            return GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: const EdgeInsets.all(20),
              children: List.generate(newNotes.length, (index) {
                final _note = NoteDB.instance.noteListNotifier.value[index];
                if (_note.id == null) {
                  const SizedBox();
                }
                return NoteItem(
                    id: _note.id!,
                    title: _note.title ?? 'No title',
                    content: _note.content ?? 'No contant');
              }),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ScreenAddNote(type: ActionType.addNote),
            ),
          );
        },
        label: const Text('New'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class NoteItem extends StatelessWidget {
  final String id;
  final String title;
  final String content;
  const NoteItem({
    Key? key,
    required this.id,
    required this.title,
    required this.content,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ScreenAddNote(
              type: ActionType.editNote,
              id: id,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    NoteDB.instance.deleteNote(id);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Text(
              content,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
