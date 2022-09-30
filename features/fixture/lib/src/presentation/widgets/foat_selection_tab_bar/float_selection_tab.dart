import 'package:flutter/material.dart';
import 'package:shared_presentation/shared_presentation.dart';
import '../../../core/enum.dart';
import '../../../core/fixture_constants.dart';
import '../../helpers/fixture_icons.dart';

class FloatSelectionTab extends StatelessWidget {
  final Function(FixturesTab tab) onClicked;
  final FixturesTab tab;
  final bool isSelected;
  final String title;
  FloatSelectionTab({
    required this.onClicked,
    required this.tab,
    required this.isSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () => onClicked(tab),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: AnimatedSlide(
                offset: Offset(0.0, isSelected ? -0.5 : 0.0),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  width: isSelected ? 48 : 24,
                  height: isSelected ? 48 : 24,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.secondary : AppColors.secondary.withOpacity(.2),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  child: AnimatedOpacity(
                    opacity: isSelected ? 1.0 : .25,
                    duration: const Duration(milliseconds: 300),
                    child: ImageWidget(
                      packageName: FixtureConstants.packageName,
                      url: FixtureIcons.icFootball,
                      width: isSelected ? 48 : 24,
                      height: isSelected ? 48 : 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Text(
                title,
                style: isSelected ? Theme.of(context).textTheme.bodyMedium : Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
