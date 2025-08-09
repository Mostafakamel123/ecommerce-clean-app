// features/auth/data/datasources/auth_remote_data_source.dart
import 'package:ecommcere_clean_app/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> loginWithEmail(String email, String password);
  Future<UserEntity> registerWithEmail(
    String email,
    String password,
    String name,
  );
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<UserEntity> loginWithEmail(String email, String password) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserEntity(
      uid: userCredential.user?.uid,
      email: userCredential.user?.email,
    );
  }

  //////////////////////////////////////////////////////////////////////////////////
  @override
  Future<UserEntity> registerWithEmail(
    String email,
    String password,
    String name,
  ) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await userCredential.user?.updateDisplayName(name);

    return UserEntity(
      uid: userCredential.user?.uid,
      email: userCredential.user?.email,
      name: name,
    );
  }
}
