import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final supabase = Supabase.instance.client;
  Map<String, dynamic> studentProfile = {};

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    final studentId = supabase.auth.currentUser?.id;
    if (studentId == null) return;

    final response = await supabase.from('students').select('*').eq('id', studentId).single();

    setState(() {
      studentProfile = response ?? {};  // Ensure it's not null
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: studentProfile.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name: ${studentProfile['name'] ?? 'Unknown'}",  // ✅ Fix: Provide a default value
                    style: TextStyle(fontSize: 18),
                  ),
                  Text("Education: ${studentProfile['education'] ?? 'Not provided'}"),  // ✅ Fix
                  Text("Skills: ${studentProfile['skills'] ?? 'No skills added'}"),  // ✅ Fix
                  ElevatedButton(
                    onPressed: () {
                      // Upload CV logic
                    },
                    child: Text("Upload CV"),
                  ),
                ],
              ),
            ),
    );
  }
}
