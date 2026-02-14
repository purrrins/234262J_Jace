import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'About',
          style: TextStyle(color: Colors.blueAccent),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                Icons.store,
                size: 80,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Cheers App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'About the App',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Cheers is your convenient neighborhood store app that brings your favorite snacks, drinks, and food items right to your fingertips. Browse our wide selection of products and enjoy a seamless shopping experience.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 24),
            Text(
              'Contact Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.phone, size: 20, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text(
                  '+65 9123 4567',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.email, size: 20, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text(
                  'support@cheers.sg',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Feedback',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.feedback, size: 20, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text(
                  'feedback@cheers.sg',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Developer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Developed by Jace Wong',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 4),
            Text(
              'Email: dev@cheers.sg',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 24),
            Divider(),
          ],
        ),
      ),
    );
  }
}
