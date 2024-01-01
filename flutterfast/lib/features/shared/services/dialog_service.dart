import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class DialogService {
  Future<bool> confirmAction({
    required BuildContext context,
    String? title,
    String? content,
    String? confirmText,
    String? cancelText,
  }) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title ?? 'Confirm Action'),
              content: content != null ? Text(content) : null,
              actions: [
                TextButton(
                  child: Text(cancelText ?? 'Cancel'),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
                TextButton(
                  child: Text(confirmText ?? 'Confirm'),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }
}