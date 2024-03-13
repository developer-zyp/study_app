import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_light_theme.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.title = '',
    required this.onTap,
    this.enable = true,
    this.child,
    this.color,
  });

  final String title;
  final VoidCallback onTap;
  final bool enable;
  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 40,
        child: InkWell(
          onTap: enable ? onTap : null,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color ?? Theme.of(context).cardColor,
            ),
            child: child ??
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: primaryColorLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
