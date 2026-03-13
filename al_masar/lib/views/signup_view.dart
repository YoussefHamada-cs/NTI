import 'package:al_masar/core/custom_container.dart';
import 'package:al_masar/core/widgets/custom_button.dart';
import 'package:al_masar/core/widgets/custom_text_from_field.dart';
import 'package:al_masar/views/login_view.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool isObscureText = true;
  bool isChecked = false;
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
            child: CustomContainer(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
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
                  CustomButton(text: 'إنشاء حساب ', onPressed: () {}),

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
        ],
      ),
    );
  }
}
