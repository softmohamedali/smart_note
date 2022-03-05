import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_flutter/core/util/mycolors.dart';

Widget MyButton({
  VoidCallback? onclick,
  String text="",
  required Color color,
  double? widht
}){
  return Container(
    width: widht,
    child: ElevatedButton(
    onPressed: (){onclick!();},
    style: ButtonStyle(
    backgroundColor:MaterialStateProperty.all<Color>(color)
    ),
    child: Text(text),
    ),
  );
}