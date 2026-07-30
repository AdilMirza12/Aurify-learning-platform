import 'package:equatable/equatable.dart';

/// Events for Splash BLoC
abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object?> get props => [];
}

/// Triggered when the splash screen initializes
class SplashStarted extends SplashEvent {
  const SplashStarted();
}
