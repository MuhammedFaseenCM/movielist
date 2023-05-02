import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String label;
  final String content;
  const TextWidget({super.key, required this.label, required this.content});

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.clip,
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
      softWrap: true,
      maxLines: 1,
      textScaleFactor: 1,
      text: TextSpan(
        text: '$label :  ',
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
              text: content,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
