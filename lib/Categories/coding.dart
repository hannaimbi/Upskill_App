import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursesPage extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {
      'title': 'Java Programming Masterclass',
      'description': 'Learn Java from scratch to advanced concepts.',
      'yt_id': 'eIrMbAQSU34',
      'rating': '4.8',
      'duration': '180 mins',
    },
    {
      'title': 'Python for Beginners',
      'description': 'Master Python with real-world projects.',
      'yt_id': 'rfscVS0vtbw',
      'rating': '4.7',
      'duration': '160 mins',
    },
    {
      'title': 'C Programming Essentials',
      'description': 'Understand C fundamentals and algorithms.',
      'yt_id': 'KJgsSFOSQv0',
      'rating': '4.6',
      'duration': '140 mins',
    },
    {
      'title': 'Web Development Bootcamp',
      'description': 'Learn HTML, CSS, JavaScript & more.',
      'yt_id': '3JluqTojuME',
      'rating': '4.9',
      'duration': '200 mins',
    },
  ];

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Courses',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            final String youtubeUrl = 'https://youtu.be/${course['yt_id']}';
            final String thumbnailUrl =
                'https://img.youtube.com/vi/${course['yt_id']}/0.jpg';

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              shadowColor: Colors.grey.withOpacity(0.3),
              margin: EdgeInsets.only(bottom: 16.0),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        thumbnailUrl,
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.broken_image, size: 100, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      course['title']!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      course['description']!,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 4),
                            Text(
                              course['rating']!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time, color: Colors.grey, size: 18),
                            SizedBox(width: 4),
                            Text(course['duration']!),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[400],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        minimumSize: Size(double.infinity, 40),
                      ),
                      onPressed: () => _launchURL(youtubeUrl),
                      child: Text(
                        'Watch on YouTube',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
