import 'package:diyet_asistanim/product/enums/platform_enum.dart';
import 'package:diyet_asistanim/product/models/number_model.dart';
import 'package:diyet_asistanim/product/utility/firebase/firebase_collections.dart';
import 'package:diyet_asistanim/product/utility/version_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(SplashState());

  Future<void> checkApplicationVersion(String clientVersion) async {
    final databaseValue = await getVersionNumberFromDatabase();

    if(databaseValue == null || databaseValue.isEmpty) {
      state = state.copyWith(isRequiredForceUpdate: true);
      return;
    }

    final checkIsNeedForceUpdate = VersionManager(deviceValue: clientVersion, databaseValue: databaseValue);

    if(checkIsNeedForceUpdate.isNeedUpdate()) {
      state = state.copyWith(isRequiredForceUpdate: true);
      return;
    }

    state = state.copyWith(isRedirectHome: true);
  }

  Future<String?> getVersionNumberFromDatabase() async{
    if(kIsWeb) return null;
    final response = await FirebaseCollections.version.referance
        .withConverter<NumberModel>(
          fromFirestore: (snapshot, option) => NumberModel().fromFirebase(snapshot),
          toFirestore: (value, option) => value.toJson(),
        )
        .doc(PlatformEnum.versionName)
        .get();

    return response.data()?.number;
  }
}

class SplashState extends Equatable {
  const SplashState({this.isRequiredForceUpdate, this.isRedirectHome});

  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;

  @override
  List<Object?> get props => [isRequiredForceUpdate, isRedirectHome];

  SplashState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
  }) {
    return SplashState(
      isRequiredForceUpdate:
          isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome:
        isRedirectHome ?? this.isRedirectHome,
    );
  }
}
