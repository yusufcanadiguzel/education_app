import 'dart:async';
import 'package:education_app/blocs/auth_bloc/auth_event.dart';
import 'package:education_app/blocs/auth_bloc/auth_state.dart';
import 'package:education_app/repositories/abstract/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;
  late final StreamSubscription<User?> _userSubscription;

  AuthenticationBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    _userSubscription = _userRepository.currentUser.listen((authUser) {
      add(const AuthenticationUserChanged());
    });
    on<AuthenticationUserChanged>(_onAuthenticationUserChanged);
  }

  void _onAuthenticationUserChanged(AuthenticationUserChanged event, Emitter<AuthenticationState> emit){
    if(event.user != null){
      emit(AuthenticationState.authenticated(event.user!));
    }else{
      emit(const AuthenticationState.unauthenticated());
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
