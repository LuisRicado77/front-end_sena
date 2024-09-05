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
          Center(
            child: name(),
          )
        ],
      ),
    );
  }
}

Widget cuerpo() {
  return Container(
    child: Text("crear nueva cuenta"),
  );
}

Widget barra() {
  return Positioned(
    child: Text("hola"),
  );
}

Widget name() {
  return Stack(
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
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 0), // Espacio entre las líneas
            Text(
              "cuenta",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ],
  );
}
