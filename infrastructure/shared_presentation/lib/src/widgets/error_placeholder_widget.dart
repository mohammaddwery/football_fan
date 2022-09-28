import 'package:flutter/material.dart';

class ErrorPlaceholderWidget extends StatelessWidget {
  final String message;
  ErrorPlaceholderWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
