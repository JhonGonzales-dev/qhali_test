import 'package:flutter/material.dart';

class CustomCircularLoading extends StatelessWidget {
  const CustomCircularLoading({
    super.key,
    this.size = 30,
    this.strokeWidth = 3,
  });
  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(strokeWidth: strokeWidth),
      ),
    );
  }
}
