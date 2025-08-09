// features/auth/presentation/cubit/auth_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:ecommcere_clean_app/features/auth/domain/entities/user_entity.dart';
import 'package:ecommcere_clean_app/features/auth/domain/usecases/signIn_usecase.dart';
import 'package:ecommcere_clean_app/features/auth/domain/usecases/signUP_usecase.dart';

import 'package:dartz/dartz.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginWithEmail loginWithEmail;
  final RegisterWithEmail registerWithEmail;

  AuthCubit({required this.loginWithEmail, required this.registerWithEmail})
    : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    final Either<Exception, UserEntity> result = await loginWithEmail(
      email,
      password,
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.toString())),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> register(String email, String password, String name) async {
    emit(AuthLoading());
    final Either<Exception, UserEntity> result = await registerWithEmail(
      email,
      password,
      name,
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.toString())),
      (user) => emit(AuthSuccess(user)),
    );
  }
}
