import 'package:common_dependencies/common_dependencies.dart';
import '../../../core/enum.dart';

class FixturesScreenHeaderBloc {

  FixturesScreenHeaderBloc() {
    _initHeaderComponentsAnimation();
  }

  _initHeaderComponentsAnimation() {
    setSecondComponentAnimationState(FixturesScreenHeaderComponentsAnimationStatus.completed);
  }

  final BehaviorSubject<FixturesScreenHeaderComponentsAnimationStatus> _firstComponentAnimationStateController = BehaviorSubject();
  ValueStream<FixturesScreenHeaderComponentsAnimationStatus> get firstComponentAnimationStateStream => _firstComponentAnimationStateController.stream;
  FixturesScreenHeaderComponentsAnimationStatus getFirstComponentAnimationState() => _firstComponentAnimationStateController.value;
  void setFirstComponentAnimationState(FixturesScreenHeaderComponentsAnimationStatus state) => _firstComponentAnimationStateController.sink.add(state);

  final BehaviorSubject<FixturesScreenHeaderComponentsAnimationStatus> _secondComponentAnimationStateController = BehaviorSubject();
  ValueStream<FixturesScreenHeaderComponentsAnimationStatus> get secondComponentAnimationStateStream => _secondComponentAnimationStateController.stream;
  FixturesScreenHeaderComponentsAnimationStatus getSecondComponentAnimationState() => _secondComponentAnimationStateController.value;
  void setSecondComponentAnimationState(FixturesScreenHeaderComponentsAnimationStatus state) => _secondComponentAnimationStateController.sink.add(state);

  final Duration componentAnimationDuration = const Duration(milliseconds: 2000);

  onFirstComponentAnimationEnded() {
    switch(getFirstComponentAnimationState()){
      case FixturesScreenHeaderComponentsAnimationStatus.completed:
        setFirstComponentAnimationState(FixturesScreenHeaderComponentsAnimationStatus.started);
        break;

      case FixturesScreenHeaderComponentsAnimationStatus.started:
        setSecondComponentAnimationState(FixturesScreenHeaderComponentsAnimationStatus.completed);
        break;
    }
  }

  onSecondComponentAnimationEnded() {
    switch(getSecondComponentAnimationState()){
      case FixturesScreenHeaderComponentsAnimationStatus.completed:
        setSecondComponentAnimationState(FixturesScreenHeaderComponentsAnimationStatus.started);
        break;

      case FixturesScreenHeaderComponentsAnimationStatus.started:
        setFirstComponentAnimationState(FixturesScreenHeaderComponentsAnimationStatus.completed);
        break;
    }
  }

  dispose() {
    _firstComponentAnimationStateController.close();
    _secondComponentAnimationStateController.close();
  }
}