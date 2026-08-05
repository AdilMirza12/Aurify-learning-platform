import 'package:equatable/equatable.dart';

class OnbordingState extends Equatable {
  final int pageIndex;
  final bool isCompleted;

  const OnbordingState({
    required this.pageIndex,
    this.isCompleted = false,
  });

  OnbordingState copyWith({
    int? pageIndex,
    bool? isCompleted,
  }) {
    return OnbordingState(
      pageIndex: pageIndex ?? this.pageIndex,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [pageIndex, isCompleted];
}
