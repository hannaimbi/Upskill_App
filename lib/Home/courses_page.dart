import 'package:flutter/material.dart';

class Course {
  final String title;
  final String description;
  final double rating;
  final String students;
  final String image;

  Course({
    required this.title,
    required this.description,
    required this.rating,
    required this.students,
    required this.image,
  });
}

class CoursesPage extends StatelessWidget {
  final List<Course> courses = [
    Course(
      title: "Data Analytics",
      description: "Master data analytics with Python, SQL, and visualization tools.",
      rating: 4.7,
      students: "15k+",
      image: "assets/images/data-analytics.jpg",
    ),
    Course(
      title: "Java Programming",
      description: "Learn Java from basics to advanced concepts with real-world projects.",
      rating: 4.8,
      students: "20k+",
      image: "assets/images/java-programming.jpg",
    ),
    Course(
      title: "Machine Learning",
      description: "Understand machine learning algorithms and build AI models.",
      rating: 4.6,
      students: "18k+",
      image: "assets/images/machine-learning.jpg",
    ),
    Course(
      title: "Web Development",
      description: "Become a full-stack developer with HTML, CSS, JavaScript, and React.",
      rating: 4.9,
      students: "25k+",
      image: "assets/images/web-development.jpg",
    ),
    Course(
      title: "Cybersecurity Fundamentals",
      description: "Protect systems and networks with essential cybersecurity skills.",
      rating: 4.5,
      students: "12k+",
      image: "assets/images/cybersecurity.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Explore Our Courses")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      course.image,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.title,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          course.description,
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 18),
                            SizedBox(width: 5),
                            Text("${course.rating} (${course.students})"),
                          ],
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Enroll Now"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 36),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
