import 'package:flutter/material.dart';

class RobotoItalic extends TextStyle {
  const RobotoItalic({double fontSize = 18.0, color}) : super(fontStyle: FontStyle.italic, fontWeight: FontWeight.w300, fontSize: fontSize, color: color);
}

class RobotoMedium extends TextStyle {
  const RobotoMedium({double fontSize = 18.0, color}) : super(fontWeight: FontWeight.w500, fontSize: fontSize, color: color);
}

class RobotoThinItalic extends TextStyle {
  const RobotoThinItalic({double fontSize = 18.0, color}) : super(fontStyle: FontStyle.italic, fontWeight: FontWeight.w100, color: color, fontSize: fontSize);
}
