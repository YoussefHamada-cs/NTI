import 'package:al_masar/core/widgets/custom_button.dart';
import 'package:al_masar/core/widgets/custom_text_from_field.dart';
import 'package:al_masar/views/signup_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            // height:
            //     MediaQuery.of(context).size.height *
            //     0.7,
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
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              decoration: const BoxDecoration(
                color: Color(0xFF1380A5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
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
                    prefixIcon: Icon(Icons.person),
                    hintText: 'رقم الهاتف',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك ادخال رقم الهاتف';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
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
                  Row(
                    children: [
                      GestureDetector(
                        child: Text(
                          'هل نسيت كلمة المرور ؟',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  CustomButton(text: 'تسجيل الدخول', onPressed: () {}),

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
        ],
      ),
    );
  }
}
