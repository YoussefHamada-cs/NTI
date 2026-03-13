import 'package:al_masar/core/custom_container.dart';
import 'package:al_masar/core/widgets/custom_button.dart';
import 'package:al_masar/core/widgets/pin_put_widget.dart';
import 'package:flutter/material.dart';


class OtpView extends StatelessWidget {
  const OtpView({super.key});

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
                  SizedBox(height: 50),
                  const Text(
                    'أدخل رمز التحقق OTP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const Text(
                    'لقد أرسلنا الكود الخاص بك إلى 010*****000.\n سينتهي هذا الكود في 00:3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20),
                  Directionality(
                    // Specify direction if desired
                    textDirection: TextDirection.rtl,
                    child: PinPutWidget(
                     
                    ),
                  ),

                  const SizedBox(height: 50),
                  CustomButton(text: 'تاكيد', onPressed: () {}),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
