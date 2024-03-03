import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings/magic_strings.dart';

class CustomBlocObserver extends BlocObserver{
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log(MagicStrings.observerOnCreate(runtimeType: bloc.runtimeType));
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log(MagicStrings.observerOnEvent(runtimeType: runtimeType, event: event));
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log(MagicStrings.observerOnChange(runtimeType: runtimeType, change: change));
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log(MagicStrings.observerOnTransition(runtimeType: runtimeType, transition: transition));
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log(MagicStrings.observerOnError(runtimeType: runtimeType, error: error));
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log(MagicStrings.observerOnClose(runtimeType: runtimeType));
  }
}