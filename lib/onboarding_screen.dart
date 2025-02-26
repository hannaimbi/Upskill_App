import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          _buildOnboardingPage(
            title: "Find the right skill for you",
            subtitle: "You've been thinking about it, now's the time to actually start!",
            image: "assets/image1.png",
            context: context,
          ),
          _buildOnboardingPage(
            title: "Connect, collaborate, and conquer new skills as a team",
            subtitle: "Upskilling is more powerful when you do it with others! Surround yourself with learners, and you’ll never stop growing.",
            image: "assets/image2.png",
            context: context,
          ),
          _buildOnboardingPage(
            title: "Upskill at your own rhythm",
            subtitle: "Flexible learning for a busy life. Learn when you can, grow as you go!",
            image: "assets/image3.png",
            isLast: true,
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage({
    required String title,
    required String subtitle,
    required String image,
    required BuildContext context,
    bool isLast = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo at the top left
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              "assets/logo1.png",
              width: 100, // Adjust size as needed
            ),
          ),
          SizedBox(height: 40), // Space after logo
          
          // Main image
          Image.asset(image, height: 250), 
          SizedBox(height: 30),

          // Bold Text
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),

          // Small Text
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          SizedBox(height: 40),

          // Updated Button with Yellow/Golden Color
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFC107), // Yellow/Golden color
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: isLast
                ? () {
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                : null,
            child: Text(
              isLast ? "Get Started" : "Get Started",
              style: TextStyle(color: Colors.black), // Text color for contrast
            ),
          ),

          // Sign In
          SizedBox(height: 15),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Text(
              "Sign in",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
