import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:al_masar_firebase_auth/core/services/firebase_auth_service.dart';
import 'package:al_masar_firebase_auth/core/services/fire_store_service.dart';
import 'package:al_masar_firebase_auth/core/errors/exceptions.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuthService authService;
  final FireStoreService fireStoreService;

  AuthCubit({required this.authService, required this.fireStoreService})
    : super(AuthInitial());

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      await authService.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      // You can also add fetching user data from Firestore here if needed
      emit(LoginSuccess());
    } on CustomException catch (e) {
      emit(AuthFailure(errMessage: e.message));
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }

  Future<void> signupUser({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final user = await authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Add additional user info to Firestore
      await fireStoreService.addData(
        path: 'users',
        documentId: user.uid,
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'uid': user.uid,
          'createdAt': DateTime.now().toIso8601String(),
        },
      );

      emit(SignupSuccess());
    } on CustomException catch (e) {
      emit(AuthFailure(errMessage: e.message));
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }

  Future<void> loginWithGoogle() async {
    emit(AuthLoadingGoogle());
    try {
      final user = await authService.logInWithGoogle();

      // Check if user exists in Firestore
      bool userExists = await fireStoreService.checkIsUserExists(
        path: 'users',
        documentId: user.uid,
      );

      if (!userExists) {
        // First time login with Google, save data to Firestore
        await fireStoreService.addData(
          path: 'users',
          documentId: user.uid,
          data: {
            'name': user.displayName ?? 'No Name',
            'email': user.email,
            'phone': user.phoneNumber ?? '',
            'uid': user.uid,
            'createdAt': DateTime.now().toIso8601String(),
          },
        );
      }

      emit(LoginSuccess());
    } on CustomException catch (e) {
      emit(AuthFailure(errMessage: e.message));
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }
}
