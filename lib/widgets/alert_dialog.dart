import 'package:flutter/material.dart';

showAlertDialog({
  required BuildContext context,
  required String title,
  required String message,
  String okButtonText = "OK",
  String cancelButtonText = "Cancel",
  VoidCallback? onOk,
  VoidCallback? onCancel,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              if (onCancel != null) {
                onCancel();
              }
            },
            child: Text(cancelButtonText),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              if (onOk != null) {
                onOk();
              }
            },
            child: Text(okButtonText),
          ),
        ],
      );
    },
  );
}
