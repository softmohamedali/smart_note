
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget passTextFailed({
  required String label,
  IconData? icon,
  TextEditingController? controller,
  ValueChanged<String>? onChanged,
  required VoidCallback onsuffixclick,
}) {
  return TextFormField(
    controller: controller,
    onChanged: (text){
      onChanged!(text);
    },
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      suffixIcon: GestureDetector(onTap: (){
        onsuffixclick!;
      },child: Icon(icon)),
    ),
  );
}