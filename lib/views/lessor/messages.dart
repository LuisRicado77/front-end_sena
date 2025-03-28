import 'package:flutter/material.dart';

void main() => runApp(const MessagesView());
class MessagesView extends StatelessWidget {
  const MessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: const Center(
        child: Text('Messages View Content'),
      ),
    );
  }
}