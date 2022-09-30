import 'package:flutter/material.dart';
import 'package:shared_presentation/shared_presentation.dart';

class RefreshButton extends StatelessWidget {
  final String title;
  final VoidCallback onClicked;
  RefreshButton({
    required this.title,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
        primary: AppColors.secondary,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
