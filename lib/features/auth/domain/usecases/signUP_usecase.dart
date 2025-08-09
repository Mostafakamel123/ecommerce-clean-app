// features/auth/domain/usecases/register_with_email.dart
import 'package:dartz/dartz.dart';
import 'package:ecommcere_clean_app/features/auth/domain/entities/user_entity.dart';
import 'package:ecommcere_clean_app/features/auth/domain/repository/auth_repo.dart';

class RegisterWithEmail {
  final AuthRepository repository;

  RegisterWithEmail(this.repository);

  Future<Either<Exception, UserEntity>> call(
    String email,
    String password,
    String name,
  ) {
    return repository.registerWithEmail(email, password, name);
  }
}
