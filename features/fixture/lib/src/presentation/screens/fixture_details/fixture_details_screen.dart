import 'package:fixture/src/presentation/helpers/fixture_subtitles_keys.dart';
import 'package:fixture/src/presentation/widgets/base_widget_state.dart';
import 'package:fixture/src/presentation/widgets/fixture_card/fixture_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_presentation/shared_presentation.dart';
import '../../../core/fixture_constants.dart';
import '../../../data/model/fixture_details/fixture_details.dart';
import '../../helpers/fixture_icons.dart';
import '../../widgets/fixture_card/fixture_info_widget.dart';
import '../../widgets/fixture_details_screen_appbar_clipper.dart';
import '../../widgets/lineup_widget/lineup_widget.dart';

class FixtureDetailsScreen extends StatefulWidget {
  final FixtureDetails fixtureDetails;
  FixtureDetailsScreen(this.fixtureDetails);

  @override
  BaseWidgetState<FixtureDetailsScreen> createState() => _FixtureDetailsScreenState();
}

class _FixtureDetailsScreenState extends BaseWidgetState<FixtureDetailsScreen> {

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            const SizedBox(height: 24,),
            buildRefereeWidget(),
            const SizedBox(height: 32,),
            buildSectionTitle(fixtureLocal.translate(FixtureSubtitlesKeys.lineup)),
            const SizedBox(height: 16,),
            LineupWidget(widget.fixtureDetails.fixture.id),
            const SizedBox(height: 24,),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return ClipPath(
      clipper: FixtureDetailsScreenAppbarClipper(),
      child: SizedBox(
        height: 310,
        child: Stack(
          children: [
            Positioned(
              top: -16,
              right: -36,
              child: ImageWidget(
                url: widget.fixtureDetails.league.logo,
                packageName: FixtureConstants.packageName,
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width* .65,
                height: MediaQuery.of(context).size.width* .65,
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
            Positioned(
              top: mediaQuery.padding.top + 8,
              left: 0,
              right: 0,
              child: buildAppbar(widget.fixtureDetails.league.name),
            ),
            Positioned(
              top: mediaQuery.padding.top + 52,
              left: 16,
              right: 16,
              child: Hero(
                tag: widget.fixtureDetails.fixture.id,
                child: FixtureInfoWidget(widget.fixtureDetails),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAppbar(String title) {
    return Row(
      children: [
        const SizedBox(width: 4),
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          borderRadius: BorderRadius.circular(32),
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        const SizedBox(width: 16,),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget buildRefereeWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionTitle('${fixtureLocal.translate(FixtureSubtitlesKeys.referee)}:'),
        const SizedBox(width: 16,),
        Text(
          widget.fixtureDetails.fixture.referee??fixtureLocal.translate(FixtureSubtitlesKeys.unknown),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget buildSectionTitle(title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4,),
          ImageWidget(
            packageName: FixtureConstants.packageName,
            url: FixtureIcons.icFootball,
            width: 12,
            height: 12,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
