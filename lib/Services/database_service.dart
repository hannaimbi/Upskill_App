import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final supabase = Supabase.instance.client;

  Future<void> addStudent(String email, String role) async {
    final userId = supabase.auth.currentUser?.id; // Get the logged-in user's ID

    if (userId == null) {
      print("User not logged in");
      return;
    }

    final response = await supabase.from('students').insert({
      'user_id': userId,
      'email': email,
      'role': role,
      'created_at': DateTime.now().toIso8601String(),
    });

    print("Student added: $response");
  }
}
