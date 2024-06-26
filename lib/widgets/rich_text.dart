import 'package:flutter/material.dart';

class RichTextBold extends StatelessWidget {
  const RichTextBold(this.firstText, this.secondText, {super.key});
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: RichText(
          softWrap: true,
          textAlign: TextAlign.start,
          text: TextSpan(
              text: "$firstText: ",
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: secondText,
                  style: const TextStyle(color: Colors.black45),
                )
              ])),
    );
  }
}
