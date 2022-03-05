import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_flutter/core/shared/shared_cubit.dart';
import 'package:note_flutter/core/shared/shared_state.dart';
import 'package:note_flutter/core/util/constants.dart';
import 'package:note_flutter/core/util/mycolors.dart';
import 'package:note_flutter/core/util/size_config.dart';

Widget MyDropMnue() {
  return BlocConsumer<SharedCubit, SharedState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
            decoration: BoxDecoration(
                border: Border.all(color: MyColors.black, width: 0.5)),
            width: SizeCongig.screenWidth,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                elevation: 20,
                value: SharedCubit.get(context).currentPriotity,
                items: SharedCubit.listPriority
                    .map((e) => myDropDownPriorityItem(priority: e))
                    .toList(),
                onChanged: (value) =>
                    SharedCubit.get(context).changePriority(value!),
              ),
            ));
      });
}

DropdownMenuItem<String> myDropDownPriorityItem(
    {required String priority}) {
  Color color;
  if(priority==Constants.PRIORITY_HIGH){
    color=MyColors.high;
  }else if(priority==Constants.PRIORITY_LOW){
    color=MyColors.low;
  }else{
    color=MyColors.medium;
  }
  return DropdownMenuItem(
      value: priority,
      child: Container(
        height: 50,
        child: Row(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                priority,
                style: TextStyle(
                    fontSize: SizeCongig.defaultSize! * 1.8,
                    color: MyColors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:color,
            ),
            width: 15,
            height: 15,
          )
        ]),
      ));
}
