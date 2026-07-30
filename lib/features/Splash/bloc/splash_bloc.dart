import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/routes/app_routes.dart';
import 'splash_event.dart';
import 'splash_state.dart';

/// BLoC managing splash screen logic and navigation decisions
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashInitial()) {
    on<SplashStarted>(_onSplashStarted);
  }

  Future<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    emit(const SplashLoading());

    // Simulate splash timer / app initialization tasks (auth check, remote config, etc.)
    await Future.delayed(const Duration(seconds: 3));

    // Determine target route (e.g. Onboarding or Dashboard)
    emit(const SplashCompleted(targetRoute: AppRoutes.onboarding));
  }
}
