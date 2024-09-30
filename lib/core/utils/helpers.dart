import 'package:flutter/material.dart';

import '../../config/themes/app_theme.dart';

class Utils {
  // static Widget buildText(String text,
  //     {double? textSize, FontWeight? textWeight, Color? textColor}) {
  //   return DefaultTextStyle(
  //     style: TextStyle(
  //       color: textColor ?? Colors.black,
  //       fontWeight:
  //           textWeight == FontWeight.bold ? FontWeight.w900 : FontWeight.w400,
  //       fontSize: textSize ?? Config.fontSize['comment']!,
  //     ),
  //     child: Text(text),
  //   );
  // }
  static Widget buildText(String text,
      {double? textSize, FontWeight? textWeight, Color? textColor}) {
    return Text(
      text,
      style: TextStyle(
        color: textColor ?? Colors.black,
        fontWeight:
            textWeight == FontWeight.bold ? FontWeight.w900 : FontWeight.w400,
        fontSize: textSize ?? Config.fontSize['comment']!,
      ),
    );
  }
}
