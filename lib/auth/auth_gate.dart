import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:upskill_app/home.dart';

import '../Pages/login_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  Future<String?> _fetchUserName() async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) return null;

    final response = await Supabase.instance.client
        .from('profiles') // Make sure 'profiles' table contains user names
        .select('name')
        .single();

    return response['name'] as String?;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        // Show loading indicator while checking session
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Check if there is a valid session
        final session = snapshot.hasData ? snapshot.data!.session : null;

        if (session != null) {
          return FutureBuilder<String?>(
            future: _fetchUserName(),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }

              if (userSnapshot.hasError || userSnapshot.data == null) {
                return const LoginPage(); // Redirect if error fetching user
              }

              final userName = userSnapshot.data ?? 'User';
              return HomeScreen();
            },
          );
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
