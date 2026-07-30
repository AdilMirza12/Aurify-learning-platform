import 'package:equatable/equatable.dart';

/// States for Splash BLoC
abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class SplashInitial extends SplashState {
  const SplashInitial();
}

/// Loading/animating state
class SplashLoading extends SplashState {
  const SplashLoading();
}

/// Completed state triggering navigation to next screen
class SplashCompleted extends SplashState {
  final String targetRoute;

  const SplashCompleted({required this.targetRoute});

  @override
  List<Object?> get props => [targetRoute];
}
