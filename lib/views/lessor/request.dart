import 'package:flutter/material.dart';

void main() => runApp(const RequestView());
class RequestView extends StatelessWidget {
  const RequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request'),
      ),
      body: Center(
        child: const Text('Request View Content'),
      ),
    );
  }
}