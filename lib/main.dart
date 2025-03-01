import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upskill_app/Home/homepage.dart';

import 'package:upskill_app/Pages/login_page.dart';
import 'package:upskill_app/auth/auth_gate.dart';
import 'package:upskill_app/onboarding_screen.dart';

import 'package:upskill_app/Splash.dart'; // Ensure the path is correct



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind1bXdtbWh3c2lvbWZmcWZteHR4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAyOTk3MDUsImV4cCI6MjA1NTg3NTcwNX0.w_SVCsDzwUivzXX3FCoZSdNhrH_b0J7b8_fXH1DZ__8', // Replace with actual key
    url: 'https://wumwmmhwsiomffqfmxtx.supabase.co', // Replace with actual URL
  );

  runApp(const UpskillApp());
}

class UpskillApp extends StatelessWidget {
  const UpskillApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // SplashScreen will handle onboarding/login navigation
      initialRoute: '/',
     routes: {
  '/onboarding':(context) =>  OnboardingScreen(),
  '/login': (context) => const LoginPage(),
  '/home': (context) => HomePage(),
  '/auth': (context) => AuthGate(),
},
 debugShowCheckedModeBanner: false,
      home: SplashScreen(), 
    );
  }
 
}
