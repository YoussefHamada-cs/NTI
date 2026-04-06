import 'package:al_masar_firebase_auth/core/custom_container.dart';
import 'package:al_masar_firebase_auth/core/widgets/custom_button.dart';
import 'package:al_masar_firebase_auth/core/widgets/custom_text_from_field.dart';
import 'package:al_masar_firebase_auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:al_masar_firebase_auth/cubits/auth_cubit/auth_state.dart';
import 'package:al_masar_firebase_auth/views/home_view.dart';
import 'package:al_masar_firebase_auth/views/otp_view.dart';
import 'package:al_masar_firebase_auth/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isObscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم تسجيل الدخول بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
          // Navigate to Home View or Next View here
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/image_login.jpeg',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomContainer(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'أهلا بك نحن سعداء بعودتك\n من فضلك قم بتسجيل الدخول',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        controller: _emailController,
                        prefixIcon: Icon(Icons.person),
                        hintText: 'البريد الالكتروني',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ' مفضلك ادخال البريد الالكتروني';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        controller: _passwordController,
                        obscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(0xFF1380A5),
                          ),
                        ),
                        prefixIcon: Icon(Icons.password),
                        hintText: 'كلمه المرور',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'من فضلك ادخل كلمه المرور';
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            child: Text(
                              'هل نسيت كلمة المرور ؟',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpView(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          }
                          return CustomButton(
                            text: 'تسجيل الدخول',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthCubit>().loginUser(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          if (state is AuthLoadingGoogle) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          }
                          return CustomButton(
                            text: 'تسجيل الدخول باستخدام جوجل',
                            onPressed: () {
                              context.read<AuthCubit>().loginWithGoogle();
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupView(),
                                ),
                              );
                            },
                            child: Text(
                              ' إنشاء حساب ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Text(
                            'ليس لديك حساب ؟  ',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
