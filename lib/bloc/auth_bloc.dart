
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);

    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  void _onAuthLoginRequested(AuthLoginRequested event,Emitter<AuthState> emit) async{
    emit(AuthLoading());
    try{
      final String email = event.email;
      final String password = event.password;
      if(password.length<6){
        return emit(AuthFailure('The password can not be less than 6 characters'));
      }
      await Future.delayed(const Duration(seconds: 1),() {
        return emit(AuthSuccess('Login successfully with : $email-$password'));
      },);
    }catch(e)
    {
      return emit(AuthFailure(e.toString()));
    }
  }

  void _onAuthLogoutRequested(AuthLogoutRequested event,Emitter<AuthState> emit)async{
    emit(AuthLoading());
    try{
      await Future.delayed(Duration(seconds: 1),(){
        return emit(AuthInitial());
      });
    }catch(e){
      return emit(AuthFailure('Failed to Logout, please try later'));
    }
  }
}
