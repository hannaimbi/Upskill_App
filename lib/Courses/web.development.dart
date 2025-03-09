import 'package:flutter/material.dart';

class WebDevelopmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Java Programming Masterclass'),
        backgroundColor: Colors.purple[400],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                'https://img.youtube.com/vi/eIrMbAQSU34/0.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Java Programming Masterclass',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Learn Java from scratch to advanced concepts.', style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 4),
                Text('4.8', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 16),
                Icon(Icons.access_time, color: Colors.grey, size: 20),
                SizedBox(width: 4),
                Text('180 mins'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
