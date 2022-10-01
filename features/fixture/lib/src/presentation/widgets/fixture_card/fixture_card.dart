import 'package:fixture/src/core/fixture_constants.dart';
import 'package:fixture/src/data/model/fixture/fixture_extension.dart';
import 'package:fixture/src/data/model/fixture_details/fixture_details.dart';
import 'package:fixture/src/presentation/localization/fixtures_delegate.dart';
import 'package:flutter/material.dart';
import 'package:shared_presentation/shared_presentation.dart';
import '../../../data/model/team/fixture_team/fixture_team.dart';import 'dart:math' as math;

import 'fixture_info_widget.dart';


class FixtureCard extends StatelessWidget {
  final FixtureDetails fixtureDetails;
  FixtureCard(this.fixtureDetails);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Positioned(
              top: -16,
              right: -36,
              bottom: -32,
              child: ImageWidget(
                url: fixtureDetails.league.logo,
                packageName: FixtureConstants.packageName,
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width* .55,
                height: MediaQuery.of(context).size.width* .55,
              ),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                width: double.infinity,
                color: Colors.grey.shade900.withOpacity(.95),
              ),
            ),
            FixtureInfoWidget(fixtureDetails),
          ],
        ),
      ),
    );
  }
}
