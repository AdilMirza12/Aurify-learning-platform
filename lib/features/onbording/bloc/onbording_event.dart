import 'package:equatable/equatable.dart';

abstract class OnbordingEvent extends Equatable {
  const OnbordingEvent();

  @override
  List<Object?> get props => [];
}

class OnbordingPageChanged extends OnbordingEvent {
  final int index;

  const OnbordingPageChanged(this.index);

  @override
  List<Object?> get props => [index];
}

class OnbordingNextPressed extends OnbordingEvent {
  const OnbordingNextPressed();
}

class OnbordingSkipPressed extends OnbordingEvent {
  const OnbordingSkipPressed();
}
