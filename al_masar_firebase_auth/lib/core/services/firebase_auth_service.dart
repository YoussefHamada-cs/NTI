import 'dart:developer';
import 'package:al_masar_firebase_auth/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  // ← static عشان init() static
  static bool _isInitialized = false;
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  static Future<void> init() async {
    if (!_isInitialized) {
      // يجب وضع الـ Web Client ID الخاص بك هنا بدلاً من 'YOUR_SERVER_CLIENT_ID'
      await _googleSignIn.initialize(
        serverClientId:
            '1068611194302-it8i9uq0lrflmv2hm54ag30osjc29r4t.apps.googleusercontent.com',
      );
      _isInitialized = true;
    }
  }

  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in createUserWithEmailAndPassword: ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException('weak-password');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('email-already-in-use');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('network-request-failed');
      } else if (e.code == 'invalid-email') {
        throw CustomException('invalid-email');
      } else {
        throw CustomException('some thing Went Wrong');
      }
    } catch (e) {
      log("Exception in createUserWithEmailAndPassword: $e");
      throw CustomException('some thing Went Wrong');
    }
  }

  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in loginWithEmailAndPassword: ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException('user-not-found');
      } else if (e.code == 'wrong-password') {
        throw CustomException('wrong-password');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('network-request-failed');
      } else if (e.code == 'invalid-email') {
        throw CustomException('invalid-email');
      } else {
        throw CustomException('some thing Went Wrong');
      }
    } catch (e) {
      log("Exception in loginWithEmailAndPassword: $e");
      throw CustomException('some thing Went Wrong');
    }
  }

  Future<User> logInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      final String? idToken = googleUser.authentication.idToken;

      final GoogleSignInClientAuthorization? authorization = await googleUser
          .authorizationClient
          .authorizationForScopes(['email', 'profile']);

      if (idToken == null) throw CustomException('فشل الحصول على idToken');
      if (authorization == null)
        throw CustomException('فشل الحصول على accessToken');

      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: idToken,
        accessToken: authorization.accessToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      final User? user = userCredential.user;
      if (user == null) throw CustomException('فشل تسجيل الدخول');

      return user;
    } on CustomException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} - ${e.message}');
      throw CustomException(_mapFirebaseError(e.code));
    } catch (e) {
      log('Exception in logInWithGoogle: $e');
      throw CustomException('حدث خطأ غير متوقع');
    }
  }

  String _mapFirebaseError(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return 'الحساب موجود بطريقة تسجيل مختلفة';
      case 'network-request-failed':
        return 'تحقق من اتصالك بالإنترنت';
      case 'user-disabled':
        return 'هذا الحساب موقوف';
      default:
        return 'حدث خطأ، حاول مرة أخرى';
    }
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
