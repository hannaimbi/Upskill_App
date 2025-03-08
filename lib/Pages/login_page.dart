import 'package:flutter/material.dart';


import 'package:upskill_app/auth/auth_service.dart';
import 'package:upskill_app/home.dart';
import 'package:upskill_app/other_screens/profile.dart';

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

  // Track loading state
  bool _isLoading = false;

  // Login function
  void login() async {
    setState(() => _isLoading = true);

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showError("Please enter both email and password.");
      setState(() => _isLoading = false);
      return;
    }

    _signIn(email, password);
  }

  void _signIn(String email, String password) async {
    try {
      final user = await authService.signInWithEmailPassword(email, password);

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  ProfileScreen()),
        );
      } else {
        _showError("Invalid credentials. Please try again.");
      }
    } catch (e) {
      _showError("Login failed: ${e.toString()}");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
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
            _isLoading
                ? const CircularProgressIndicator()
                :ElevatedButton(
  onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  },
  child: const Text('Login'),
),
            const SizedBox(height: 10),
           GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    ); // ✅ Corrected closing parenthesis
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
