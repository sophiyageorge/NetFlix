import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:noteapp/data/get_allresp_model/get_allresp_model.dart';
import 'package:noteapp/data/url.dart';

import 'note_model/note_model.dart';

abstract class ApiCalls {
  Future<NoteModel?> createNote(NoteModel value);
  Future<List<NoteModel>?> getAllNotes();
  Future<NoteModel?> updateNote(NoteModel value);
  Future<void> deleteNote(String id);
}

class NoteDB extends ApiCalls {
  // single turn //

  NoteDB._internal();

  static NoteDB instance = NoteDB._internal();

  factory() {
    return instance;
  }

  final dio = Dio();
  final url = Url();

  ValueNotifier<List<NoteModel>> noteListNotifier = ValueNotifier([]);

  NoteDB() {
    dio.options = BaseOptions(
      baseUrl: url.basUrl,
      responseType: ResponseType.plain,
    );
  }

  @override
  Future<NoteModel?> createNote(NoteModel value) async {
    final _result = await dio.post(url.createNote, data: value.toJson());
    final _resultAsjson = jsonDecode(_result.data);
    final _note = NoteModel.fromJson(_resultAsjson as Map<String, dynamic>);
    noteListNotifier.value.insert(0, _note);
    noteListNotifier.notifyListeners();
    return _note;
  }

  @override
  Future<void> deleteNote(String id) async {
    final _result =
        await dio.delete(url.basUrl + url.deleteNote.replaceFirst('{id}', id));

    if (_result.data == null) {
      return;
    }
    final _index = noteListNotifier.value.indexWhere((note) => note.id == id);
    if (_index == -1) {
      return;
    }
    noteListNotifier.value.removeAt(_index);
    noteListNotifier.notifyListeners();
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    final _result = await dio.get(url.basUrl + url.getAllNote);
    if (_result.data != null) {
      final _resultAsJson = jsonDecode(_result.toString());
      final getNoteResp = GetAllrespModel.fromJson(_resultAsJson);
      noteListNotifier.value.clear();
      noteListNotifier.value.addAll(getNoteResp.data.reversed);
      noteListNotifier.notifyListeners();
      return getNoteResp.data;
    }

    return [];
  }

  @override
  Future<NoteModel?> updateNote(NoteModel value) async {
    final _result =
        await dio.put(url.basUrl + url.updateNote, data: value.toJson());
    print('update');
    if (_result.data == null) {
      return null;
    }

    // find index
    final index =
        noteListNotifier.value.indexWhere((note) => note.id == value.id);
    if (index == -1) {
      return null;
    }

    // remove from index

    noteListNotifier.value.removeAt(index);

    // add note in list

    noteListNotifier.value.insert(index, value);
    noteListNotifier.notifyListeners();
    return value;
  }

  NoteModel? getNotById(String id) {
    print('getnotbyid');
    try {
      return noteListNotifier.value.firstWhere((note) => note.id == id);
    } catch (e) {
      return null;
    }
  }
}
