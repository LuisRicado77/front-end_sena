import 'package:flutter/material.dart';
import 'package:app_sena/views/login/login.dart';
import 'package:app_sena/views/estate/more_information.dart';
import 'package:app_sena/views/tenant/favorites.dart';
import 'package:app_sena/views/login/create_acount.dart';
import 'package:app_sena/views/tenant/find_property.dart';
//import 'package:app_sena/views/tenant/test.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      title: "Mi new App",
      home: const FindProperty(),
    );
  }
}
