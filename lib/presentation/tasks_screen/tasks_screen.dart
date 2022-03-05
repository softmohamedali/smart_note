import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_flutter/core/shared/shared_cubit.dart';
import 'package:note_flutter/core/shared/shared_state.dart';
import 'package:note_flutter/core/util/constants.dart';
import 'package:note_flutter/core/util/mycolors.dart';
import 'package:note_flutter/core/util/size_config.dart';
import 'package:note_flutter/core/widgets/break_line.dart';
import 'package:note_flutter/core/widgets/note_item_builder.dart';
import 'package:note_flutter/domain/models/note.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SharedCubit, SharedState>(
        listener: (context, states) {},
        builder: (context, state) {
          var cubit = SharedCubit.get(context);
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child:cubit.viewValue==Constants.VIEW_GROUB_STRAGGERD?
                 MasonryGridView.count(
                  itemCount: cubit.allNote.length,
                  crossAxisCount: 2,
                  itemBuilder: (context, index) {
                    return noteItemBuilder(
                        cubit.allNote[index],
                        SizeCongig.screenWidth! * 0.5
                    );
                  },
                ):ListView(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                      cubit.allNote.length, (index) {
                    print(index);
                    print(cubit.allNote[index]);

                    return noteItemBuilder(
                        cubit.allNote[index],
                      double.infinity
                    );
                  }
                  ),
                ),
              ),
              Container(
                width: !cubit.isBottomSheetOpen?0:double.infinity,
                height: !cubit.isBottomSheetOpen?0:double.infinity,
                color:!cubit.isBottomSheetOpen?MyColors.none:MyColors.black.withOpacity(0.5),
              ),
            ],
          );
        });
  }
}





