import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';

import '../configs/app_colors.dart';

class ContentArea extends StatelessWidget {
  final Widget child;
  final bool addPadding;

  const ContentArea({super.key, required this.child, this.addPadding = true});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          color: scaffoldColor(context),
        ),
        padding: addPadding
            ? EdgeInsets.only(
                top: appScreenPadding,
                left: appScreenPadding,
                right: appScreenPadding,
              )
            : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
