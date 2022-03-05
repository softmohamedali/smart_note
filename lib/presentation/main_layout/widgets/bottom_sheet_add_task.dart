import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_flutter/core/shared/shared_cubit.dart';
import 'package:note_flutter/core/shared/shared_state.dart';
import 'package:note_flutter/core/util/mycolors.dart';
import 'package:note_flutter/core/util/size_config.dart';
import 'package:note_flutter/core/widgets/my_button.dart';
import 'package:note_flutter/core/widgets/my_drop_menu.dart';
import 'package:note_flutter/core/widgets/mytext_failed.dart';

Widget addTaskBottomSheet() {
  var formKey = GlobalKey<FormState>();
  return BlocConsumer<SharedCubit, SharedState>(
    listener: (context, states) {
    },
    builder: (context, state) {
      var cubit=SharedCubit.get(context);
      return Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      myTextFailed(
                          label: "Title",
                          onChanged: (text) {cubit.title=text;},
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "required failed";
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      MyDropMnue(),
                      const SizedBox(
                        height: 20,
                      ),
                      myTextFailed(
                          label: "Note",
                          maxLine: 6,
                          onChanged: (text) {cubit.note=text;},
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "required failed";
                            }
                          }),
                      const SizedBox(
                        height: 80,
                      ),
                      MyButton(
                          text: "Save",
                          color: MyColors.main_color,
                          widht: SizeCongig.screenWidth! * 0.7,
                          onclick: () {
                            if(formKey.currentState!.validate()){
                              cubit.insertNote();
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child:state is OnLoading?CircularProgressIndicator():SizedBox(),
              )
            ],
          ),
        ),
      );
    },
  );
}
