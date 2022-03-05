import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:note_flutter/core/util/constants.dart';
import 'package:note_flutter/core/util/mycolors.dart';
import 'package:note_flutter/core/util/size_config.dart';
import 'package:note_flutter/domain/models/note.dart';

Widget noteItemBuilder(
    Note note,
    double width
    ) {
  Color color;
  if(note.proirity==Constants.PRIORITY_HIGH){
    color=MyColors.high;
  }else if(note.proirity==Constants.PRIORITY_LOW){
    color=MyColors.low;
  }else{
    color=MyColors.medium;
  }
  return Padding(
    padding: const EdgeInsets.only(top: 16, bottom: 0, left: 8, right: 8),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1)),
      width: width,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Title : ${note.title}",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
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
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Priority : ${note.proirity}",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Content : ${note.content}",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
            ),
            // GridView.count(
            //   crossAxisCount: 2,
            //   children: List.generate(convert(note.tasks!)!.length, (index) {
            //     return Text(
            //       'Item',
            //     );
            //   }),
            // ),
          ],
        ),
      ),
    ),
  );
}
