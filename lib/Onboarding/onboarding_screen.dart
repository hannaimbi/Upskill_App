import 'package:flutter/material.dart';
import 'onboarding_page.dart'; // Import the onboarding page

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      Navigator.pushReplacementNamed(context, '/auth'); // Go to login after last page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            children: [
              OnboardingPage(
                title: "Find the right skill for you",
                subtitle: "You've been thinking about it, now's the time to actually start!",
                image: "assets/image1.png",
              ),
              OnboardingPage(
                title: "Connect, collaborate, and conquer new skills as a team",
                subtitle: "Upskilling is more powerful when you do it with others!",
                image: "assets/image2.png",
              ),
              OnboardingPage(
                title: "Upskill at your own rhythm",
                subtitle: "Flexible learning for a busy life. Learn when you can, grow as you go!",
                image: "assets/image3.png",
                isLast: true,
              ),
            ],
          ),

          // Next/Get Started Button
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 5, 5, 5),
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: _nextPage,
                  child: Text(
                    _currentPage == 2 ? "Get Started" : "Next",
                    style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/auth'),
                  child: Text("Sign in", style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
