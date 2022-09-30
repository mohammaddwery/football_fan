import 'package:fixture/src/core/fixture_constants.dart';
import 'package:fixture/src/data/model/fixture/fixture_extension.dart';
import 'package:fixture/src/data/model/fixture_details/fixture_details.dart';
import 'package:fixture/src/presentation/localization/fixtures_delegate.dart';
import 'package:flutter/material.dart';
import 'package:shared_presentation/shared_presentation.dart';
import '../../data/model/team/fixture_team/fixture_team.dart';import 'dart:math' as math;


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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildTeamWidget(context, fixtureDetails.teams.home),
                  const SizedBox(width: 8,),
                  buildFixtureInfo(context),
                  const SizedBox(width: 8,),
                  buildTeamWidget(context, fixtureDetails.teams.away),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTeamWidget(BuildContext context, FixtureTeam team) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageWidget(
            packageName: FixtureConstants.packageName,
            url: team.logo,
            width: 96,
            height: 96,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 12,),
          Text(
            team.name,
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildFixtureInfo(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          if(fixtureDetails.fixture.isFinished) Text(
            '${fixtureDetails.goals.home} : ${fixtureDetails.goals.away}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if(fixtureDetails.fixture.isUpcoming) Text(
            'VS',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16,),
          Text(
            fixtureDetails.fixture.formattedDate,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 4,),
          Text(
            fixtureDetails.fixture.formattedTime,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }

}
