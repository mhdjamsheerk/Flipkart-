import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Add settings functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with your actual notification count
        itemBuilder: (context, index) {
          return _buildNotificationItem(index);
        },
      ),
    );
  }


  Widget _buildNotificationItem(int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(Icons.notifications, color: Colors.white),
        ),
        title: Text('Notification $index'),
        subtitle: const Text('This is a sample notification message.'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Add functionality when a notification is tapped
        },
      ),
    );
  }
}