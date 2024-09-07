import 'package:flutter/material.dart';

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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/muebles.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 50, // Ajusta la posición vertical
            left: 360, // Ajusta la posición horizontal
            child: Column(
              children: [
                // Imagen del logo
                Image.asset(
                  'assets/images/logo.jpeg', // Coloca la ruta correcta de tu logo
                  width: 60, // Ajusta el ancho
                  height: 60, // Ajusta la altura
                ),
                const SizedBox(height: 1.5),
                // Texto debajo de la imagen
                const Text(
                  'CASA SINU',
                  style: TextStyle(
                    color: Colors.black, // Cambia según lo que necesites
                    fontSize: 15,
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
                child: login(),
              ),
              Positioned(
                  child: SizedBox(
                width: 450,
                child: nombre(),
              )),
              Positioned(
                  child: SizedBox(
                width: 450,
                child: password(),
              )),
              Positioned(
                child: campos(),
              ),
              Positioned(
                  child: SizedBox(
                width: 450,
                child: bottom(),
              )),
              Positioned(
                  child: SizedBox(
                width: 450,
                child: crearCuenta(),
              )),
            ],
          ),
        ],
      ),
    );
  }
}

Widget login() {
  return const Stack(
    children: [
      Align(
        alignment: Alignment(-0.0, -0.1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "inicio",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 70,
                color: Colors.white,
              ),
            ),
          ],
        ),
      )
    ],
  );
}

/*
Widget barra() {
  return const Positioned(
    child: Text("hola"),
  );
}
*/
/*
Widget aboveText() {
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
*/
/*
Widget cuadroTexto() {
  return TextField(
    obscureText: true,
    style: const TextStyle(
      color: Colors.white,
    ),
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.green,
        hintText: "*****************",
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none)),
  );
}
*/
Widget password() {
  return Stack(
    children: [
      Positioned(
        top: 790, // Aquí puedes ajustar la distancia desde la parte superior
        left: 40, // Puedes ajustar la distancia desde la izquierda
        right: 8, // Ajusta para darle espacio desde la derecha si es necesario
        child: TextField(
          obscureText: true,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xff647749),
            hintText: "",
            hintStyle: const TextStyle(
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

Widget nombre() {
  return Stack(
    children: [
      Positioned(
        top: 670, // Aquí puedes ajustar la distancia desde la parte superior
        left: 40, // Puedes ajustar la distancia desde la izquierda
        right: 8, // Ajusta para darle espacio desde la derecha si es necesario
        child: TextField(
          obscureText: false,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xff647749),
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

/*
Widget email() {
  return Stack(
    children: [
      Positioned(
        top: 782, // Aquí puedes ajustar la distancia desde la parte superior
        left: 40, // Puedes ajustar la distancia desde la izquierda
        right: 8, // Ajusta para darle espacio desde la derecha si es necesario
        child: TextField(
          obscureText: false,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xff647749),
            hintText: "",
            hintStyle: const TextStyle(
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
*/
Widget campos() {
  return const Stack(
    children: [
      Positioned(
          top: 640, // Aquí puedes ajustar la distancia desde la parte superior
          left: 40, // Puedes ajustar la distancia desde la izquierda
          right: 20,
          child: Text(
            "NOMBRE",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
      Positioned(
          top: 760, // Aquí puedes ajustar la distancia desde la parte superior
          left: 40, // Puedes ajustar la distancia desde la izquierda
          right: 20,
          child: Text(
            "CONTRASEÑA",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
    ],
  );
}

Widget bottom() {
  return Stack(
    children: [
      Positioned(
        top: 900, // Distancia desde la parte superior
        left: 40, // Distancia desde la izquierda
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(400, 70),
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
            'ingresar',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget crearCuenta() {
  return const Stack(
    children: [
      Positioned(
        top: 1000,
        left: 140,
        child: Text(
          "olvido su contraseña?",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
          ),
        ),
      ),
      Positioned(
        top: 1029,
        left: 180,
        child: Text(
          "Crear cuenta !",
          style: TextStyle(fontFamily: "Poppins", color: Colors.white),
        ),
      )
    ],
  );
}
