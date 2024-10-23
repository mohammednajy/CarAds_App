import 'package:flutter/material.dart';

extension PopupWidget on BuildContext {
  void showSnackBar(String message) => ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
  showDialogPopUp({
    required String text,
  }) {
    showDialog(
        context: this,
        builder: (context) => Center(
              child: Dialog(
                alignment: Alignment.center,
                child: Text(text),
              ),
            ));
  }
}
