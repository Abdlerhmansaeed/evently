import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthManger {
  static Future<UserCredential?> createAccount({
    required String emailAddress,
    required String password,
    required String name,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      await credential.user?.updateDisplayName(name);
      return credential;
    } on FirebaseAuthException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<UserCredential?> login({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      print(credential);
      return await FirebaseAuth.instance.signInWithCredential(credential);


    } catch (e) {}
    return null;
  }

  static Future<UserCredential?> resetPassword(String email) async {
    try {
      final credential =
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        
    } catch (e) {}
    return null;
  }
}
