import 'package:flutter/cupertino.dart';
import 'package:note_flutter/domain/models/note.dart';

abstract class Repo{
  insertNote(Note note);
  deleteNote({
    required Note note,
    required Function onSuccess,
    required ValueChanged <String> onError
  });
  Future<List<Note>> getAllNote();
  Future<List<Note>> getNoteHighPriority();
  Future<List<Note>> getAllLowPriority();
  upDateNote(Note note);
  deleteAllNote();
  saveViewValue(String value);
  getViewValue();
}

