import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({super.key, required this.child, this.color, this.width = 60, this.onTap});

  final Widget child;
  final Color? color;
  final double width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      shape: CircleBorder(),
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
