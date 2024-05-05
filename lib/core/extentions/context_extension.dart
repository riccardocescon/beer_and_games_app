import 'package:beer_and_games/theme.dart';
import 'package:flutter/material.dart';

extension ThemeShotcuts on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension TextStyleShortcut on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension NavigationShortcut on BuildContext {
  void push(Widget page, {bool fullscreenDialog = false}) {
    Navigator.of(this).push(
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => page,
      ),
    );
  }

  void pushReplacement(Widget page, {bool fullscreenDialog = false}) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => page,
      ),
    );
  }

  void pop() {
    Navigator.of(this).pop();
  }
}

extension SnackBarShortcut on BuildContext {
  void warningSnackbar(String title, String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: MaterialTheme.darkScheme().surfaceContainerHigh,
        action: SnackBarAction(
          label: 'Chiudi',
          onPressed: () {
            ScaffoldMessenger.of(this).hideCurrentSnackBar();
          },
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.titleMedium?.copyWith(
                color: Colors.amber,
              ),
            ),
            Text(
              message,
              style: textTheme.bodyMedium?.copyWith(
                color: MaterialTheme.darkScheme().onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void successSnackbar(String title, String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: MaterialTheme.darkScheme().surfaceContainerHigh,
        action: SnackBarAction(
          label: 'Chiudi',
          onPressed: () {
            ScaffoldMessenger.of(this).hideCurrentSnackBar();
          },
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.titleMedium?.copyWith(
                color: Colors.green,
              ),
            ),
            Text(
              message,
              style: textTheme.bodyMedium?.copyWith(
                color: MaterialTheme.darkScheme().onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension DialogShotcut on BuildContext {
  void showOkDialog(String title, String message, {String action = 'Ok'}) {
    showDialog(
      context: this,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.primary,
            ),
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(action),
            ),
          ],
        );
      },
    );
  }

  Future<bool?> showSimpleChoiceDialog(
    String title,
    String message, {
    String positiveAction = 'Yes',
    String negativeAction = 'No',
  }) async {
    return await showDialog<bool>(
      context: this,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.primary,
            ),
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(positiveAction),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(negativeAction),
            ),
          ],
        );
      },
    );
  }
}
