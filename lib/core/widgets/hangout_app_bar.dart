import 'package:flutter/material.dart';

AppBar hangoutAppBar(BuildContext context, {required String title}) {
  return AppBar(
    title: Text(title),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
  );
}
