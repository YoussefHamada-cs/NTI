import 'package:al_masar_firebase_auth/core/services/firebase_auth_service.dart';
import 'package:al_masar_firebase_auth/core/services/fire_store_service.dart';
import 'package:al_masar_firebase_auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:al_masar_firebase_auth/firebase_options.dart';
import 'package:al_masar_firebase_auth/views/on_boarding_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAuthService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            authService: FirebaseAuthService(),
            fireStoreService: FireStoreService(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardingView(),
      ),
    );
  }
}
