// features/auth/data/repositories/auth_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:ecommcere_clean_app/features/auth/domain/repository/auth_repo.dart';

import '../../domain/entities/user_entity.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Exception, UserEntity>> loginWithEmail(
    String email,
    String password,
  ) async {
    try {
      final user = await remoteDataSource.loginWithEmail(email, password);
      return Right(user);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, UserEntity>> registerWithEmail(
    String email,
    String password,
    String name,
  ) async {
    try {
      final user = await remoteDataSource.registerWithEmail(
        email,
        password,
        name,
      );
      return Right(user);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
