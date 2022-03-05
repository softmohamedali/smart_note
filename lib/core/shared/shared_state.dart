abstract class SharedState{}

class Init extends SharedState{}

class ChangedCurrentIndexScreen extends SharedState{}
class OpenBottomSheet extends SharedState{}
class ChangePriority extends SharedState{}
class ChangeView extends SharedState{}



class OnError extends SharedState{
  var errorMasg;
  OnError(this.errorMasg);
}
class OnSucces<T> extends SharedState{
  T data;
  OnSucces(this.data);
}
class OnLoading extends SharedState{}