import 'package:flutter/material.dart';

void main() => runApp(const PublicarPropiedad());

class PublicarPropiedad extends StatelessWidget {
  const PublicarPropiedad({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Fondo con imagen
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/muebles.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Logo e texto
            Positioned(
              top: 70,
              left: 30,
              child: Column(
                children: [
                  // Imagen del logo
                  Image.asset(
                    'assets/images/logo.jpeg',
                    width: 90,
                    height: 90,
                  ),
                  const SizedBox(height: 1.5),
                  // Texto debajo de la imagen
                  const Text(
                    'CASA SINU',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Parte gris inclinada
            Positioned(
              top: 430,
              left: -290,
              child: Transform.rotate(
                angle: -0.4,
                child: Container(
                  width: 1200,
                  height: 1500,
                  color: Colors.grey[800],
                ),
              ),
            ),
            // Línea verde inclinada
            Positioned(
              top: 300,
              left: -60,
              child: Transform.rotate(
                angle: -0.4,
                child: Container(
                  width: 700,
                  height: 47,
                  color: const Color(0xFF87ba42),
                ),
              ),
            ),
            // Botones
            Positioned(
              top: 650,
              left: 45,
              child: bottom("Publicar propiedad"),
            ),
            Positioned(
              top: 820,
              left: 45,
              child: bottom("Mis propiedades"),
            ),
            Positioned(
              top: 990,
              left: 45,
              child: bottom("Compradores"),
            ),
            Positioned(
              top:
                  500, // Ajustamos para darle más margen desde la parte superior
              left: 150, // Añadimos más espacio desde la izquierda
              child: Container(
                height: 100, // Altura de la imagen
                width: 200, // Ancho de la imagen
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icons/user.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget bottom(String mensaje) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(400, 70),
      backgroundColor: const Color(0xff87ba42),
      foregroundColor: Colors.white,
      disabledBackgroundColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide.none,
      ),
    ),
    onPressed: () {
      print("Botón presionado: $mensaje");
    },
    child: Text(
      mensaje,
      style: const TextStyle(
        fontSize: 20,
      ),
    ),
  );
}
