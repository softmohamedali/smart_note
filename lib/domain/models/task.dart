class Task{
  String? name;
  bool? isDone;

  Task({
    this.name="",
    this.isDone=false,
});

  Task.fromJson(Map<dynamic,dynamic> json){
    name=json["name"];
    isDone=json["isDone"];
  }
  toJson(){
    return{
      "name":name,
      "isDone":isDone
    };
  }

}