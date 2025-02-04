import 'package:app_sena/views/lessor/publicar_propiedad.dart';
import 'package:app_sena/views/tenant/find_property.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({super.key});

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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //final TextEditingController _rolController = TextEditingController();

  Future<void> _login() async {
    const String apiUrl =
        "http://192.168.101.93:3001/users/login"; // Cambia por tu URL

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": _usernameController.text,
          "password": _passwordController.text,
          //"rol": _rolController.text
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("Login exitoso: ${data['token']}");
        final String token = data['token'];
        final String idRol = data['idRol'];
        if (idRol == "1") {
          //lessor
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PublicarPropiedad()));
        } else if (idRol == "2") {
          //tenant
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const FindProperty()));
        }

        // Aquí puedes guardar el token y navegar a otra pantalla
      } else {
        print("Error en login: ${response.body}");
      }
    } catch (e) {
      print("Error de conexión: $e");
    }
  }

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
                  'assets/images/edificioverde.png', // Coloca la ruta correcta de tu logo
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
                child: campos(_usernameController, _passwordController),
              ),
              Positioned(
                  child: SizedBox(
                width: 450,
                child: bottom(_login),
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

Widget password(TextEditingController passwordController) {
  return Stack(
    children: [
      Positioned(
        top: 790, // Aquí puedes ajustar la distancia desde la parte superior
        left: 40, // Puedes ajustar la distancia desde la izquierda
        right: 8, // Ajusta para darle espacio desde la derecha si es necesario
        child: TextField(
          controller: passwordController,
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

Widget campos(TextEditingController usernameController,
    TextEditingController passwordController) {
  //print(usernameController);
  //print(passwordController);
  return Stack(
    children: [
      const Positioned(
          top: 640,
          left: 40,
          right: 20,
          child: Text(
            "CORREO",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
      Positioned(
        top: 670, // Ajusta la posición según sea necesario
        left: 40,
        right: 20,
        child: TextField(
          controller: usernameController,
          style: const TextStyle(color: Colors.white),
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
      const Positioned(
          top: 760,
          left: 40,
          right: 20,
          child: Text(
            "CONTRASEÑA",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
      Positioned(
        top: 790,
        left: 40,
        right: 20,
        child: TextField(
          controller: passwordController,
          obscureText: true,
          style: const TextStyle(color: Colors.white),
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

Widget bottom(VoidCallback onPressed) {
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
          onPressed: onPressed,
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
