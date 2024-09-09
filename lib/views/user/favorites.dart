import 'package:app_sena/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Favorites());

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      title: "MyApp",
      home: const Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _inicioState();
}

class _inicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xff545454)),
        child: Stack(
          children: [
            // Posicionamos la barra verde
            Positioned(
              top: 0,
              left: 0, // Ajustamos para que la barra comience desde la esquina
              child: Transform.rotate(
                angle:
                    0, // No necesitas rotar la barra si la quieres horizontal
                child: Container(
                  width: MediaQuery.of(context)
                      .size
                      .width, // Ancho del dispositivo
                  height: 70, // Grosor de la barra
                  color: const Color(0xFFa3d65d), // Color verde
                ),
              ),
            ),

            // Posicionamos la imagen de usuario
            Positioned(
              top:
                  15, // Ajustamos para darle más margen desde la parte superior
              left: 20, // Añadimos más espacio desde la izquierda
              child: Container(
                height: 50, // Altura de la imagen
                width: 50, // Ancho de la imagen
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icons/user.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // Posicionamos el texto "data"
            Positioned(
              top: 20, // Ajustamos para colocarlo debajo de la barra e imagen
              left: 150, // Alineamos con la imagen del usuario
              child: const Text(
                "Mis favoritos",
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            Positioned(
              top:
                  250, // Ajustamos para darle más margen desde la parte superior
              left: 50, // Añadimos más espacio desde la izquierda
              child: Container(
                height: 300, // Altura de la imagen
                width: 350, // Ancho de la imagen
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/seacherwithhouse.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 600, // Ajustamos para colocarlo debajo de la barra e imagen
              left: 40, // Alineamos con la imagen del usuario
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "no hay favoritos guardados!",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "cuando marques un anuncio como ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "favorito lo podrás ver aquí",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: bottom(),
            )
          ],
        ),
      ),
    );
  }
}

Widget bottom() {
  return Stack(
    children: [
      Positioned(
        top: 760, // Distancia desde la parte superior
        left: 85, // Distancia desde la izquierda
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(300, 70),
              backgroundColor:
                  const Color(0xff87ba42), // Color de fondo del botón
              foregroundColor: Colors.white, // Color del texto
              disabledBackgroundColor:
                  Colors.grey, // Color cuando el botón está deshabilitado

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide.none)),
          onPressed: () {
            print("Botón presionado");
          },
          child: const Text(
            'Buscar',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    ],
  );
}
