import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> fetchUserData() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    final response = await supabase
        .from('Students')
        .select()
        .eq('user_id', userId);

    return response;
  }
}
