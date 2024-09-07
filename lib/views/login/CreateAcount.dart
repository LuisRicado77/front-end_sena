import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      title: "Mi App",
      home: const Inicio(),
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/muebles.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 70, // Ajusta la posición vertical
            left: 30, // Ajusta la posición horizontal
            child: Column(
              children: [
                // Imagen del logo
                Image.asset(
                  'assets/images/logo.jpeg', // Coloca la ruta correcta de tu logo
                  width: 90, // Ajusta el ancho
                  height: 90, // Ajusta la altura
                ),
                SizedBox(height: 1.5),
                // Texto debajo de la imagen
                Text(
                  'CASA SINU',
                  style: TextStyle(
                    color: Colors.black, // Cambia según lo que necesites
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Parte gris inclinada
          Positioned(
            top: 430, // Ajusta la posición
            left: -290, // Ajusta la posición
            child: Transform.rotate(
              angle: -0.4, // Ajusta el ángulo para la inclinación
              child: Container(
                width: 1200, // Ajusta el ancho de la sección gris
                height: 1500, // Ajusta el alto de la sección gris
                color: Colors.grey[800], // Color gris oscuro
              ),
            ),
          ),
          Positioned(
            top: 300, // Ajusta la posición
            left: -60, // Ajusta la posición
            child: Transform.rotate(
              angle: -0.4, // Ajusta el ángulo para que sea diagonal
              child: Container(
                width: 700, // Ajusta el ancho de la línea
                height: 47, // Ajusta el grosor de la línea
                color: const Color(0xFF87ba42), // Color verde
              ),
            ),
          ),
          Stack(
            children: [
              Positioned(
                child: name(),
              ),
              Positioned(
                child: Password(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget cuerpo() {
  return Container(
    child: const Text("crear nueva cuenta"),
  );
}

Widget barra() {
  return const Positioned(
    child: Text("hola"),
  );
}

Widget name() {
  return const Stack(
    children: [
      Align(
        alignment: Alignment(
            -0.0, -0.1), // Puedes ajustar la alineación según sea necesario
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "crear nueva",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 0), // Espacio entre las líneas
            Text(
              "cuenta",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            Text("ya tiene cuenta? inicia sesión",
                style: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontWeight: FontWeight.w100)),
          ],
        ),
      ),
    ],
  );
}

Widget cuadroTexto() {
  return TextField(
    obscureText: true,
    style: TextStyle(
      color: Colors.white,
    ),
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.green,
        hintText: "*****************",
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none)),
  );
}

Widget Password() {
  return Stack(
    children: [
      Positioned(
        top: 900, // Aquí puedes ajustar la distancia desde la parte superior
        left: 20, // Puedes ajustar la distancia desde la izquierda
        right: 20, // Ajusta para darle espacio desde la derecha si es necesario
        child: TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 68, 105, 70),
            hintText: "*****************",
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    ],
  );
}
