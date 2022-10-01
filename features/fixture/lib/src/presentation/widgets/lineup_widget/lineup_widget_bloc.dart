import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/services.dart';
import '../../../data/model/lineup/lineup.dart';
import '../../../data/model/lineup/lineup_adapter.dart';
import '../../../domain/use_case/fetch_lineup_List_use_case.dart';

class LineupWidgetBloc extends BaseBloc<Lineup>{
  final int _fixtureId;
  final FetchLineupListUseCase _fetchLineupListUseCase;
  LineupWidgetBloc({
    required int fixtureId,
    required FetchLineupListUseCase fetchLineupListUseCase,
  }): _fixtureId = fixtureId,
        _fetchLineupListUseCase = fetchLineupListUseCase {
    fetchLineupList();
  }

  /// This method for calculation the current player index in the players list,
  ///
  /// it's depending on:
  /// @param:{formation} formation list which represents the team's formation,
  /// but splitted to digits, each one of them is the line's players count.
  ///
  /// @param:{formationDigitsIndex} the current index of formation's digits
  /// which represents the line's players count.
  ///
  /// @param:{linePlayersIndex} the current player's index in specific line.
  ///
  /// When we iterate on first line's players using first digit of formation list,
  /// we keep using the index of player in this line OTHERWISE,
  /// we should add the previous players count to current line's player index.
  int calculateCurrentPlayerIndex({
    required List<int> formations,
    required int formationDigitsIndex,
    required int linePlayersIndex,
  }) {
    // int index = 0;
    if (formationDigitsIndex == 0) {
      return linePlayersIndex;
    }

    int prevLinePlayers = formations
        .take(formationDigitsIndex)
        .reduce((value, element) => value + element);
    return (prevLinePlayers + linePlayersIndex);
  }

  final BehaviorSubject<UiState<List<Lineup>>?> _lineupListController = BehaviorSubject();
  ValueStream<UiState<List<Lineup>>?> get lineupListStream => _lineupListController.stream;
  UiState<List<Lineup>>? getLineupList() => _lineupListController.valueOrNull;
  void setLineupList(UiState<List<Lineup>>? uiState) => _lineupListController.sink.add(uiState);

  fetchLineupList() {
    handleResultListRequest(
      getCurrentState: getLineupList,
      setCurrentState: setLineupList,
      exceptionTag: 'fetchLineupList()',
      getResponseResult: () async {
        return await _fetchLineupListUseCase.call(_fixtureId);
      },
    );
  }

  @override
  dispose() {
    _lineupListController.close();
  }
}