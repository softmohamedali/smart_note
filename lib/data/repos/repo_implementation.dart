import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:note_flutter/data/local/data_base_source.dart';
import 'package:note_flutter/data/prefrences/shared_prefrences.dart';
import 'package:note_flutter/domain/models/note.dart';
import 'package:note_flutter/domain/repos/repo.dart';

@LazySingleton()
@Injectable(as: Repo)
class RepoImp extends Repo {
  final NoteDataBase _dataBase;
  final SharedData _sharedData;

  RepoImp(this._dataBase,this._sharedData);

  @override
  deleteNote({
    required Note note,
    required Function onSuccess,
    required ValueChanged <String> onError
  }) {
    _dataBase.delelteNote(
        note: note,
        onSuccess: () {onSuccess;},
        onError: (msg){onError(msg);}
    );
  }

  @override
  Future<List<Note>> getAllLowPriority() {
    return _dataBase.getNotesLowPriority();
  }

  @override
  Future<List<Note>> getAllNote() {
    return _dataBase.getAllNotes();
  }

  @override
  Future<List<Note>> getNoteHighPriority() {
    return _dataBase.getNotesHighPriority();
  }

  @override
  insertNote(Note note) {
    _dataBase.insertNote(note);
  }

  @override
  upDateNote(Note note) {
    _dataBase.upDateNote(note);
  }

  @override
  deleteAllNote() {
    _dataBase.delelteAllNote();
  }



  @override
  Future<bool?> saveViewValue(String value) {
    return _sharedData.saveViewValue(value);
  }

  @override
  Future<String?> getViewValue() {
    return _sharedData.getViewValue();
  }

}