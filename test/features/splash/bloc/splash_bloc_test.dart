import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:aurify/features/Splash/bloc/splash_bloc.dart';
import 'package:aurify/features/Splash/bloc/splash_event.dart';
import 'package:aurify/features/Splash/bloc/splash_state.dart';
import 'package:aurify/core/routes/app_routes.dart';

void main() {
  group('SplashBloc', () {
    late SplashBloc splashBloc;

    setUp(() {
      splashBloc = SplashBloc();
    });

    tearDown(() {
      splashBloc.close();
    });

    test('initial state should be SplashInitial', () {
      expect(splashBloc.state, const SplashInitial());
    });

    blocTest<SplashBloc, SplashState>(
      'emits [SplashLoading, SplashCompleted] with onboarding route when SplashStarted is added',
      build: () => splashBloc,
      act: (bloc) => bloc.add(const SplashStarted()),
      wait: const Duration(seconds: 3), // SplashBloc has a 3-second delay
      expect: () => const <SplashState>[
        SplashLoading(),
        SplashCompleted(targetRoute: AppRoutes.onboarding),
      ],
    );
  });
}
