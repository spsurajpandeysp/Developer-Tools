import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {'title': 'Keyword Analysis Complete', 'time': '10 min ago'},
    {'title': 'New Tool Added: SEO Analyzer', 'time': '30 min ago'},
    {'title': 'Performance Report Ready', 'time': '1 hour ago'},
    {'title': 'Daily SEO Insights', 'time': 'Yesterday'},
    {'title': 'Keyword Rankings Updated', 'time': '2 days ago'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF1E1E2C),
        iconTheme: IconThemeData(color: Colors.amber),
      ),
      backgroundColor: Color(0xFFF0F0F5),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            color: Colors.black,
            elevation: 3,
            shadowColor: Colors.grey[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.grey, width: 1),
            ),
            child: ListTile(
              leading: Icon(Icons.notifications, color: Colors.amber),
              title: Text(
                notification['title']!,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                notification['time']!,
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
          );
        },
      ),
    );
  }
}
