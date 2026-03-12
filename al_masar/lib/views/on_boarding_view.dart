import 'package:al_masar/core/widgets/custom_button.dart';
import 'package:al_masar/views/welcome_view.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image_onboarding.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 50,
            left: 50,
            bottom: 20,
            child: CustomButton(
              text: 'دعنا نبداء',
              backgroundColor: Color(0xffe33c64),
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeView()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
