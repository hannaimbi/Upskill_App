import 'package:flutter/material.dart';
import 'package:upskill_app/Home/homepage.dart';
import 'package:upskill_app/Pages/register_page.dart';
import 'package:upskill_app/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Get auth service instance
  final authService = AuthService();

  // Text field controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Login function
  void login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    _signIn(email, password);
  }

  void _signIn(String email, String password) async {
    try {
      await authService.signInWithEmailPassword(email, password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: const Text(
                "Don't have an account? Sign Up",
                style: TextStyle(color: Color.fromARGB(255, 81, 94, 104)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
