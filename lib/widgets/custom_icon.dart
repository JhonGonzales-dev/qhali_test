import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon,
    required this.onPress,
    required this.iconColor,
  });
  final IconData icon;
  final VoidCallback onPress;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: IconButton(
        onPressed: onPress,
        icon: Icon(icon, size: 30, color: iconColor),
      ),
    );
  }
}
