import 'package:flutter/material.dart';

class UtilsApp {
  static showBottomSheet(BuildContext context, {Widget? child}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: child,
          );
        });
  }
}
