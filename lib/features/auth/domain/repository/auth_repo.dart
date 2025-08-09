// features/auth/domain/repositories/auth_repository.dart
import 'package:dartz/dartz.dart';
import 'package:ecommcere_clean_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Exception, UserEntity>> loginWithEmail(
    String email,
    String password,
  );
  Future<Either<Exception, UserEntity>> registerWithEmail(
    String email,
    String password,
    String name,
  );
}
