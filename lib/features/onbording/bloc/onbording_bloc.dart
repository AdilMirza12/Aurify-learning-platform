import 'package:flutter_bloc/flutter_bloc.dart';
import 'onbording_event.dart';
import 'onbording_state.dart';

class OnbordingBloc extends Bloc<OnbordingEvent, OnbordingState> {
  OnbordingBloc() : super(const OnbordingState(pageIndex: 0)) {
    on<OnbordingPageChanged>(_onPageChanged);
    on<OnbordingNextPressed>(_onNextPressed);
    on<OnbordingSkipPressed>(_onSkipPressed);
  }

  void _onPageChanged(
    OnbordingPageChanged event,
    Emitter<OnbordingState> emit,
  ) {
    emit(state.copyWith(pageIndex: event.index));
  }

  void _onNextPressed(
    OnbordingNextPressed event,
    Emitter<OnbordingState> emit,
  ) {
    if (state.pageIndex < 2) {
      emit(state.copyWith(pageIndex: state.pageIndex + 1));
    } else {
      emit(state.copyWith(isCompleted: true));
    }
  }

  void _onSkipPressed(
    OnbordingSkipPressed event,
    Emitter<OnbordingState> emit,
  ) {
    emit(state.copyWith(isCompleted: true));
  }
}
