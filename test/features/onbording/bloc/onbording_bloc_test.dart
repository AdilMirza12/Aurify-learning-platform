import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:aurify/features/onbording/bloc/onbording_bloc.dart';
import 'package:aurify/features/onbording/bloc/onbording_event.dart';
import 'package:aurify/features/onbording/bloc/onbording_state.dart';

void main() {
  group('OnbordingBloc', () {
    late OnbordingBloc onbordingBloc;

    setUp(() {
      onbordingBloc = OnbordingBloc();
    });

    tearDown(() {
      onbordingBloc.close();
    });

    test('initial state should have pageIndex 0 and not be completed', () {
      expect(onbordingBloc.state, const OnbordingState(pageIndex: 0, isCompleted: false));
    });

    blocTest<OnbordingBloc, OnbordingState>(
      'emits state with updated pageIndex when OnbordingPageChanged is added',
      build: () => onbordingBloc,
      act: (bloc) => bloc.add(const OnbordingPageChanged(1)),
      expect: () => const <OnbordingState>[
        OnbordingState(pageIndex: 1, isCompleted: false),
      ],
    );

    blocTest<OnbordingBloc, OnbordingState>(
      'emits state with incremented pageIndex when OnbordingNextPressed is added on page 0',
      build: () => onbordingBloc,
      act: (bloc) => bloc.add(const OnbordingNextPressed()),
      expect: () => const <OnbordingState>[
        OnbordingState(pageIndex: 1, isCompleted: false),
      ],
    );

    blocTest<OnbordingBloc, OnbordingState>(
      'emits state with incremented pageIndex when OnbordingNextPressed is added on page 1',
      build: () => onbordingBloc,
      seed: () => const OnbordingState(pageIndex: 1, isCompleted: false),
      act: (bloc) => bloc.add(const OnbordingNextPressed()),
      expect: () => const <OnbordingState>[
        OnbordingState(pageIndex: 2, isCompleted: false),
      ],
    );

    blocTest<OnbordingBloc, OnbordingState>(
      'emits state with isCompleted true when OnbordingNextPressed is added on page 2 (last page)',
      build: () => onbordingBloc,
      seed: () => const OnbordingState(pageIndex: 2, isCompleted: false),
      act: (bloc) => bloc.add(const OnbordingNextPressed()),
      expect: () => const <OnbordingState>[
        OnbordingState(pageIndex: 2, isCompleted: true),
      ],
    );

    blocTest<OnbordingBloc, OnbordingState>(
      'emits state with isCompleted true when OnbordingSkipPressed is added on page 0',
      build: () => onbordingBloc,
      act: (bloc) => bloc.add(const OnbordingSkipPressed()),
      expect: () => const <OnbordingState>[
        OnbordingState(pageIndex: 0, isCompleted: true),
      ],
    );

    blocTest<OnbordingBloc, OnbordingState>(
      'emits state with isCompleted true when OnbordingSkipPressed is added on page 1',
      build: () => onbordingBloc,
      seed: () => const OnbordingState(pageIndex: 1, isCompleted: false),
      act: (bloc) => bloc.add(const OnbordingSkipPressed()),
      expect: () => const <OnbordingState>[
        OnbordingState(pageIndex: 1, isCompleted: true),
      ],
    );
  });
}
