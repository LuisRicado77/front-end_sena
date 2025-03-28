import 'package:flutter/material.dart';

void main() {
  runApp(const NotificationsView());
}



class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: const Center(
        child: Text('No notifications yet.'),
      ),
    );
  }
}