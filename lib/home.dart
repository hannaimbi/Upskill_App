import 'package:flutter/material.dart';
import 'package:upskill_app/other_screens/add.dart';
import 'package:upskill_app/other_screens/alumini.dart';
import 'package:upskill_app/other_screens/profile.dart';
import 'package:upskill_app/other_screens/whishlist.dart';
import 'Categories/analytics.dart';
import 'Categories/coding.dart';
import 'Categories/designing.dart';
import 'Categories/marketing.dart';
import 'other_screens/leaderboard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, Hanna'),
        actions: [IconButton(icon: Icon(Icons.notifications), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            _buildWelcomeSection(),
            SizedBox(height: 20),

            // Top Categories
            Text('Top Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildCategoryRow(context),
            SizedBox(height: 20),

            // Popular Courses
            Text('Popular Courses', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildCourseList(),
            SizedBox(height: 20),

            // Leaderboard Section
            Text('Leaderboard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LeaderboardScreen())),
              child: _buildLeaderboardCard(),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Start your learning journey now!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                ElevatedButton(onPressed: () {}, child: Text('Get Started')),
              ],
            ),
          ),
          Image.asset('assets/images/start.jpg', width: 80, height: 80),
        ],
      ),
    );
  }

  Widget _buildCategoryRow(BuildContext context) {
    List<String> categories = ['Coding', 'Designing', 'Marketing', 'Analytics'];
    List<String> icons = [
      'assets/images/coding.png',
      'assets/images/designing.png',
      'assets/images/marketing.png',
      'assets/images/analytics.png'
    ];
    List<Widget> screens = [
      CodingScreen(),
      DesigningScreen(),
      MarketingScreen(),
      AnalyticsScreen(),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(categories.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => screens[index]));
          },
          child: Column(
            children: [
              Image.asset(icons[index], width: 50, height: 50),
              SizedBox(height: 5),
              Text(categories[index], style: TextStyle(fontSize: 14)),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildCourseList() {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCourseCard('Web Development', 'assets/images/web_development.png'),
          _buildCourseCard('UX Designing', 'assets/images/designing.png'),
        ],
      ),
    );
  }

  Widget _buildCourseCard(String title, String imagePath) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 60, height: 60),
          SizedBox(height: 5),
          Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildLeaderboardCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/violet.png', width: 80, height: 80),
          SizedBox(width: 10),
          Text('Leaderboard', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
