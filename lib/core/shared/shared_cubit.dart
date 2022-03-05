import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:note_flutter/core/shared/shared_state.dart';
import 'package:note_flutter/core/util/constants.dart';
import 'package:note_flutter/data/repos/repo_implementation.dart';
import 'package:note_flutter/domain/models/note.dart';
import 'package:note_flutter/domain/repos/repo.dart';
import 'package:note_flutter/presentation/done_tasks_screen/done_tasks_screen.dart';
import 'package:note_flutter/presentation/important_screen/important_screen.dart';
import 'package:note_flutter/presentation/tasks_screen/tasks_screen.dart';

@Injectable()
class SharedCubit extends Cubit<SharedState>{
  final RepoImp repoImp;

  static SharedCubit get(BuildContext context) => BlocProvider.of(context);
  List<Widget> listHomeScreen=[TasksScreen(),DoneTaskScreen(),ImportantScreen()];
  List<String> listTitle=["Tasks","Done","Important"];
  static List<String> listPriority=[
    Constants.PRIORITY_LOW,Constants.PRIORITY_MEDIUM,Constants.PRIORITY_HIGH
  ];
  var currentIndext=0;
  String currentPriotity=listPriority[0];
  var fabIcon=Icons.add;
  var isBottomSheetOpen=false;
  var title="";
  var note="";
  List<Note> allNote=[];
  var viewValue;


  SharedCubit(this.repoImp):super(Init()){
    getViewValue();
    getAllNote();
  }

  saveViewValue()async {
    await repoImp.saveViewValue(viewValue);
    getViewValue();
    emit(ChangeView());

  }

  getViewValue()async{
    repoImp.getViewValue().then((value){
      if(value==null){
        viewValue=Constants.VIEW_GROUB_STRAGGERD;
      }else{
        viewValue=value;
      }
    });
    emit(ChangeView());
  }

  insertNote(){
    emit(OnLoading());
    Note mynote=Note(
        title:title,
        time: TimeOfDay.now().toString(),
        content: note,
        proirity:currentPriotity.toString()
    );
    repoImp.insertNote(mynote);
    emit(OnSucces("suceess"));
    getAllNote();
  }

  delteNote(){
    emit(OnLoading());
    Note mynote=Note(
        title:title,
        time: TimeOfDay.now().toString(),
        content: note,
        proirity:currentPriotity
    );
    repoImp.deleteNote(
      note: mynote,
      onError: (error){
        emit(OnError("suceess"));
      },
      onSuccess: (){
        emit(OnSucces("suceess"));
      }
    );
    getAllNote();
  }

  upDateNote(){
    emit(OnLoading());
    Note mynote=Note(
        title:title,
        time: TimeOfDay.now().toString(),
        content: note,
        proirity:currentPriotity
    );
    repoImp.upDateNote(mynote);
    emit(OnSucces("suceess"));
    getAllNote();
  }

  deleteAllNote(){
    repoImp.deleteAllNote();
    getAllNote();
  }

  getAllNote(){
    emit(OnLoading());
    repoImp.getAllNote().then((value){
      allNote=value;
      emit(OnSucces("suceess"));
    }).catchError((error){
      emit(OnError(error));
      print(error);
    });
  }

  getNoteHighPriority(){
    emit(OnLoading());
    repoImp.getNoteHighPriority().then((value){
      allNote=value;
      emit(OnSucces("suceess"));
    }).catchError((error){
      emit(OnError(error));
      print(error);
    });
  }

  getNoteLowPriority(){
    emit(OnLoading());
    repoImp.getAllLowPriority().then((value){
      allNote=value;
      emit(OnSucces("suceess"));
    }).catchError((error){
      emit(OnError(error));
      print(error);
    });
  }

  void navToScreenOfIndex(int index)
  {
    currentIndext=index;
    emit(ChangedCurrentIndexScreen());
  }

  void changePriority(String priority)
  {
    currentPriotity=priority;
    emit(ChangePriority());
  }

  void openBottomSheet(){
    isBottomSheetOpen=!isBottomSheetOpen;
    if(isBottomSheetOpen){fabIcon=Icons.close;}else{fabIcon=Icons.add;}
    emit(OpenBottomSheet());
  }


}