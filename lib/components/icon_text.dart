// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

/// icon text
class IconText extends StatelessWidget {
  final String text;
  final Icon icon;
  final Axis direction;

  /// icon padding
  final EdgeInsetsGeometry padding;
  final TextStyle style;
  final bool softWrap;
  final TextOverflow overflow;
  final TextAlign textAlign;

  const IconText(
    {Key? key,
    required this.text,
    required this.icon,
    required this.style,
    this.padding = const EdgeInsets.only(right: 5),
    this.direction = Axis.horizontal,
    this.softWrap = true,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(style: style, children: [
        WidgetSpan(
            child: IconTheme(
          data: IconThemeData(size: style.fontSize, color: style.color),
          child: Padding(
                  padding: padding,
                  child: icon,
                ),
        )),
        TextSpan(
            text: direction == Axis.horizontal ? text : "\n$text"),
      ]),
      softWrap: softWrap,
      overflow: overflow,
      textAlign: direction == Axis.horizontal ? TextAlign.start : TextAlign.center,
    );
  }
}
