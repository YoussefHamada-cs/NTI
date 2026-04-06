import 'package:al_masar_firebase_auth/core/custom_container.dart';
import 'package:al_masar_firebase_auth/core/widgets/custom_button.dart';
import 'package:al_masar_firebase_auth/core/widgets/custom_text_from_field.dart';
import 'package:al_masar_firebase_auth/cubits/auth_cubit/auth_cubit.dart';
import 'package:al_masar_firebase_auth/cubits/auth_cubit/auth_state.dart';
import 'package:al_masar_firebase_auth/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool isObscureText = true;
  bool isChecked = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
        } else if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم إنشاء الحساب بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
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
                      CustomTextFormField(
                        controller: _nameController,
                        prefixIcon: Icon(Icons.person),
                        hintText: 'الاسم كامل',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'من فضلك ادخال الاسم كامل ';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        controller: _emailController,
                        prefixIcon: Icon(Icons.email),
                        hintText: 'البريد الالكتروني',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'من فضلك ادخال البريدالالكتروني';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        controller: _phoneController,
                        prefixIcon: Icon(Icons.phone),
                        hintText: 'رقم الهاتف',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'من فضلك ادخال رقم الهاتف';
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
                            isObscureText ? Icons.visibility_off : Icons.visibility,
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
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: Color(0xFF1380A5),
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              side: const BorderSide(color: Colors.grey),
                            ),
                            Text('اوافق علي '),
                            Text(
                              'الاحكام و الشروط',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return Center(child: CircularProgressIndicator(color: Colors.white));
                          }
                          return CustomButton(
                            text: 'إنشاء حساب ',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (!isChecked) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('يجب الموافقة على الشروط والأحكام'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }
                                context.read<AuthCubit>().signupUser(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  phone: _phoneController.text,
                                  password: _passwordController.text,
                                );
                              }
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
                                  builder: (context) => LoginView(),
                                ),
                              );
                            },
                            child: Text(
                              'تسجيل دخول',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Text(
                            ' هل لديك حساب بالفعل؟ ',
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
