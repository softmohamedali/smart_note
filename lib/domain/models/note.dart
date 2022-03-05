import 'package:note_flutter/core/util/constants.dart';
import 'package:note_flutter/domain/models/task.dart';

class Note {
  int? id;
  String? title;
  String? time;
  String? content;
  String? proirity=Constants.PRIORITY_LOW;
  String? tasks;

  Note({
    this.id,
    this.title="",
    this.time="",
    this.content="",
    this.proirity
  });

  Note.fromJson(Map<dynamic,dynamic> json){
    id=json["id"];
    title=json["title"];
    time=json["time"];
    content=json["content"];
    proirity=json["proirity"];
    tasks=json["tasks"];
  }
  toJson(){
    return({
      "id":id,
      "title":title,
      "time":time,
      "content":content,
      "proirity":proirity,
      "tasks":tasks
    });
  }
}