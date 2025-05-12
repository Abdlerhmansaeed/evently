import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthManger {
  static Future<AuthResult> createAccount({
    required String emailAddress,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      await credential.user?.updateDisplayName(name);
      return AuthResult.success(credential);
    } on FirebaseAuthException catch (e) {
      return AuthResult.failure(_getCreateAccountErrorMessage(e));
    } catch (e) {
      return AuthResult.failure('An unexpected error occurred');
    }
  }

  static Future<AuthResult> login({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return AuthResult.success(credential);
    } on FirebaseAuthException catch (e) {
      return AuthResult.failure(_getLoginErrorMessage(e));
    } catch (e) {
      return AuthResult.failure('An unexpected error occurred');
    }
  }

  static Future<AuthResult> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return AuthResult.failure('Google sign in was cancelled');
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      
      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      return AuthResult.success(userCredential);
    } on FirebaseAuthException catch (e) {
      return AuthResult.failure(_getGoogleSignInErrorMessage(e));
    } catch (e) {
      return AuthResult.failure('Failed to sign in with Google');
    }
  }

  static Future<AuthResult> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return AuthResult.success(null, message: 'Password reset email sent');
    } on FirebaseAuthException catch (e) {
      return AuthResult.failure(_getPasswordResetErrorMessage(e));
    } catch (e) {
      return AuthResult.failure('Failed to send password reset email');
    }
  }

  // Helper methods for error messages
  static String _getCreateAccountErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'The email address is already in use';
      case 'invalid-email':
        return 'The email address is not valid';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled';
      case 'weak-password':
        return 'The password is too weak';
      default:
        return 'Failed to create account: ${e.message}';
    }
  }

  static String _getLoginErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is not valid';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'user-not-found':
        return 'No account found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      default:
        return 'Failed to sign in: ${e.message}';
    }
  }

  static String _getGoogleSignInErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'account-exists-with-different-credential':
        return 'An account already exists with this email';
      case 'invalid-credential':
        return 'Invalid Google credentials';
      case 'operation-not-allowed':
        return 'Google sign in is not enabled';
      default:
        return 'Failed to sign in with Google: ${e.message}';
    }
  }

  static String _getPasswordResetErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is not valid';
      case 'user-not-found':
        return 'No account found with this email';
      default:
        return 'Failed to send password reset email: ${e.message}';
    }
  }
}

class AuthResult {
  final UserCredential? credential;
  final String? errorMessage;
  final String? message;

  AuthResult.success(this.credential, {this.message}) : errorMessage = null;
  AuthResult.failure(this.errorMessage) 
    : credential = null, message = null;

  bool get isSuccess => errorMessage == null;
}