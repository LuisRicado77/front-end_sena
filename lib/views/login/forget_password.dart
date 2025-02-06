import 'package:flutter/material.dart';

void main() => runApp(const ForgotPassword());

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("olvide contraseña page"),
    );
  }
}
