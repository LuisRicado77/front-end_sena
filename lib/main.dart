import 'package:flutter/material.dart';

void main() => runApp(miApp());

class miApp extends StatelessWidget {
  const miApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi App",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Sena flutter"),
      ),
      body: Center(
        child: Image.asset('assets/logo.jpeg'), // Aquí defines la ruta
      ),
    );
  }
}
