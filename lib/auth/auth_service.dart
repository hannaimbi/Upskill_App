import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Sign in with email and password
  Future<AuthResponse?> signInWithEmailPassword(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      print("Sign-in Error: $e");
      return null;
    }
  }

  // Sign up with email, password, and name
  Future<AuthResponse?> signUpWithEmailPassword(String email, String password, String name) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user != null) {
        // Store user data in the "users" table
        await _supabase.from('users').insert({
          'id': user.id, // Ensure it links with the auth.users table
          'name': name,
          'email': email,
        });
      }

      return response;
    } catch (e) {
      print("Sign-up Error: $e");
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      print("Sign-out Error: $e");
    }
  }

  // Get current user data (email and name)
  Future<String?> getUserName(String userId) async {
    try {
      final response = await _supabase
          .from('users') // ✅ Ensure "users" table has "name" column
          .select('name')
          .eq('id', userId)
          .single();

      return response['name'] as String?;
    } catch (e) {
      print("Error fetching user name: $e");
      return null;
    }
  }
}
