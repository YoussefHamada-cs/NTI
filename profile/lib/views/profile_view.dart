import 'package:flutter/material.dart';
import 'package:profile/widgets/close_account_button.dart';
import 'package:profile/widgets/widget_user_id.dart';
import 'package:profile/widgets/widget_information.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Center(
                child: const CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    'https://www.pngall.com/wp-content/uploads/5/Profile-PNG-High-Quality-Image.png',
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Center(
                child: const Text(
                  'Software Developer',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              Divider(),
              const SizedBox(height: 16),
              Text(
                'Profile Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              WidgetInformation(leading: 'Name:', title: 'Youssef'),
              WidgetInformation(
                leading: 'Email:',
                title: 'youssef@example.com',
              ),
              const SizedBox(height: 16),
              Divider(),
              const SizedBox(height: 16),
              Text(
                'Personal Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              WidgetUserID(),
              WidgetInformation(leading: 'Phone:', title: '+1234567890'),
              WidgetInformation(
                leading: 'Address:',
                title: '123 Main St, City',
              ),
              WidgetInformation(leading: 'Date of Birth:', title: '01/01/1990'),
              WidgetInformation(leading: 'Gender:', title: 'Male'),
              Divider(),
              const SizedBox(height: 16),
              CloseAccountButton(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
