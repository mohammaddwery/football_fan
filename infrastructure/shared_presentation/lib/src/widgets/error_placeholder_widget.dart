import 'package:flutter/material.dart';

class ErrorPlaceholderWidget extends StatelessWidget {
  final String message;
  final Widget? refreshButton;
  ErrorPlaceholderWidget(this.message, {this.refreshButton});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if(refreshButton!=null) const SizedBox(height: 24,),
            if(refreshButton!=null) refreshButton!,
          ],
        ),
      ),
    );
  }
}
