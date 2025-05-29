import 'package:chat_bot/core/datasource_execution/datasource_execution.dart';
import 'package:chat_bot/core/datasource_execution/results.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRemoteDatasource {
  final FirebaseAuth auth;
  final DataSourceExecution dataSourceExecution;

  AuthRemoteDatasource(this.auth, this.dataSourceExecution);

  Future<Results<User>> register(
    String email,
    String password,
    String name,
  ) async {
    var response = await dataSourceExecution.execute(() async {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Success(userCredential.user);
    });
    return response;
  }

  Future<Results<User>> login(String email, String password) async {
    var response = await dataSourceExecution.execute(() async {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Success(userCredential.user);
    });
    return response;
  }

  Future<Results<void>> logout() async {
    var response = await dataSourceExecution.execute(() async {
      await auth.signOut();
      return Success(null);
    });
    return response;
  }

  Future<Results<bool>> sendPasswordResetEmail(String email) async {
    var response = await dataSourceExecution.execute(() async {
      await auth.sendPasswordResetEmail(email: email);
      return Success(true);
    });
    return response;
  }

  Future<Results<User>> googleLogin() async {
    var response = await dataSourceExecution.execute(() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return Success(userCredential.user);
    });
    return response;
  }

  Future<void> logOut() async {
    await auth.signOut();
  }
}
