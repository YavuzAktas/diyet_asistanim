import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(SplashState());
}

class SplashState extends Equatable {
  SplashState({this.isRequiredForceUpdate});

  final bool? isRequiredForceUpdate;

  @override
  List<Object?> get props => [isRequiredForceUpdate];

  SplashState copyWith({
    bool? isRequiredForceUpdate,
  }) {
    return SplashState(
      isRequiredForceUpdate:
          isRequiredForceUpdate ?? this.isRequiredForceUpdate,
    );
  }
}
