import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_flutter/core/shared/shared_cubit.dart';
import 'package:note_flutter/core/shared/shared_state.dart';
import 'package:note_flutter/core/util/constants.dart';
import 'package:note_flutter/core/util/mycolors.dart';
import 'package:note_flutter/core/util/size_config.dart';
import 'package:note_flutter/core/widgets/my_drop_menu.dart';
import 'package:note_flutter/di/injection.dart';
import 'package:note_flutter/presentation/main_layout/widgets/bottom_sheet_add_task.dart';
import 'package:note_flutter/presentation/tasks_screen/tasks_screen.dart';

class MainLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeCongig.init(context);
    return BlocProvider(
      create: (BuildContext context) => getIt<SharedCubit>(),
      child: BlocConsumer<SharedCubit, SharedState>(
        listener: (context, state) {},
        builder: (context, state) {
          var shCubit = SharedCubit.get(context);
          return Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                backgroundColor: MyColors.main_color,
                actions: [
                  PopupMenuButton<int>(
                    onSelected: (item) {handleClick(item: item, context: context);},
                    icon: Icon(Icons.filter_list),
                    itemBuilder: (context) => [
                      PopupMenuItem<int>(value: 0, child:myDropDownPriorityItem(priority:Constants.PRIORITY_HIGH)),
                      PopupMenuItem<int>(value: 1, child: myDropDownPriorityItem(priority:Constants.PRIORITY_LOW)),
                    ],
                  ),
                  PopupMenuButton<int>(
                    onSelected: (item) {
                      handlePuplicClick(item: item, context: context);
                      },
                    itemBuilder: (context) => [
                      PopupMenuItem<int>(value: 0, child:Text("Delete All")),
                      PopupMenuItem<int>(value: 1,child:Text("List View")),
                      PopupMenuItem<int>(value: 2,child:Text("Straggerd View")),
                    ],
                  ),
                ],
                title: Text(shCubit.listTitle[shCubit.currentIndext]),
              ),
              body: TasksScreen(),
              // shCubit.listHomeScreen[shCubit.currentIndext],
              floatingActionButton: FloatingActionButton(
                backgroundColor: MyColors.main_color,
                onPressed: () {
                  if (shCubit.isBottomSheetOpen) {
                    Navigator.pop(context);
                    shCubit.openBottomSheet();
                  } else {
                    scaffoldKey.currentState!
                        .showBottomSheet(
                            (context) =>
                                addTaskBottomSheet(),
                        elevation:16 )
                    .closed.then((value){
                      shCubit.isBottomSheetOpen=false;
                      shCubit.fabIcon=Icons.add;
                      shCubit.emit(OpenBottomSheet());
                    });
                    shCubit.openBottomSheet();
                  }
                },
                child: Icon(shCubit.fabIcon),
              ),
              // bottomNavigationBar: BottomNavigationBar(
              //   currentIndex: shCubit.currentIndext,
              //   onTap: (index) {
              //     shCubit.navToScreenOfIndex(index);
              //   },
              //   items: const [
              //     BottomNavigationBarItem(
              //         icon: Icon(Icons.menu), label: "Tasks"),
              //     BottomNavigationBarItem(
              //         icon: Icon(Icons.done), label: "Done"),
              //     BottomNavigationBarItem(
              //         icon: Icon(Icons.star), label: "Important")
              //   ],
              // )
            );
        },
      ),
    );
  }
  void handleClick({
  required int item,
    required BuildContext context
}) {
    switch (item) {
      case 0:
        {
          SharedCubit.get(context).getNoteHighPriority();
        }
        break;
      case 1:
        {
          SharedCubit.get(context).getNoteLowPriority();
        }
        break;
    }
  }

  void handlePuplicClick({
    required int item,
    required BuildContext context
  }) {
    switch (item) {
      case 0:
        {
          SharedCubit.get(context).deleteAllNote();
        }
        break;
      case 1:
        {
          SharedCubit.get(context).viewValue=Constants.VIEW_GROUB_LIST;
          SharedCubit.get(context).saveViewValue();
        }
        break;
      case 2:
        {
          SharedCubit.get(context).viewValue=Constants.VIEW_GROUB_STRAGGERD;
          SharedCubit.get(context).saveViewValue();
        }
        break;
    }
  }
}
