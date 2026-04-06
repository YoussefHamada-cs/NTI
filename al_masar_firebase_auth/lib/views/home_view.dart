import 'package:al_masar_firebase_auth/core/services/fire_store_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final User? currentUser = FirebaseAuth.instance.currentUser;
  final FireStoreService _fireStoreService = FireStoreService();

  Future<String> _getUserName() async {
    if (currentUser == null) return 'مستخدم';
    
    try {
      final userData = await _fireStoreService.getData(
        path: 'users',
        docuementId: currentUser!.uid,
      );
      
      if (userData != null && userData['name'] != null) {
        return userData['name'];
      }
      
      // Fallback to Firebase Auth user display name (for Google login where firestore doc might not be ready yet)
      if (currentUser!.displayName != null && currentUser!.displayName!.isNotEmpty) {
        return currentUser!.displayName!;
      }
    } catch (e) {
      debugPrint('Error fetching user data: $e');
    }
    
    return 'مستخدم';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<String>(
          future: _getUserName(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('hi ...');
            }
            final name = snapshot.data ?? 'مستخدم';
            return Text('hi $name');
          },
        ),
      ),
      body: Center(
        child: Text(
          'مرحبا بك في الصفحة الرئيسية',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
