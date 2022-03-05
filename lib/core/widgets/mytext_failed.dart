import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myTextFailed({
  required String label,
  IconData? icon,
  TextEditingController? controller,
  ValueChanged<String>? onChanged,
  int? maxLine=1,
  FormFieldValidator<String>? validate
}) {
  return TextFormField(
    controller: controller,
    maxLines:maxLine,
    textAlignVertical: TextAlignVertical.top,
    onChanged: (text){
      onChanged!(text);
    },
    validator: validate,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      suffixIcon: Icon(icon),
    ),
  );
}
