import 'package:flutter/material.dart';

void main() => runApp(const MoreInformation());

class MoreInformation extends StatelessWidget {
  const MoreInformation({super.key});
//color #545454
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xff545454)),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: campos(),
            ),
            Positioned(
              child: name(),
            ),
            Positioned(
              child: email(),
            ),
            Positioned(
              child: telefono(),
            ),
            Positioned(
              child: opinion(),
            ),
            Positioned(
              child: bottom(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget informacio() {
  return Container();
}

Widget name() {
  return Stack(
    children: [
      Positioned(
        top: 320, // Aquí puedes ajustar la distancia desde la parte superior
        left: 40, // Puedes ajustar la distancia desde la izquierda
        right: 45, // Ajusta para darle espacio desde la derecha si es necesario
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

Widget email() {
  return Stack(
    children: [
      Positioned(
        top: 460, // Aquí puedes ajustar la distancia desde la parte superior
        left: 40, // Puedes ajustar la distancia desde la izquierda
        right: 45, // Ajusta para darle espacio desde la derecha si es necesario
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

Widget telefono() {
  return Stack(
    children: [
      Positioned(
        top: 600, // Aquí puedes ajustar la distancia desde la parte superior
        left: 40, // Puedes ajustar la distancia desde la izquierda
        right: 45, // Ajusta para darle espacio desde la derecha si es necesario
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

Widget opinion() {
  return Stack(
    children: [
      Positioned(
        top: 682, // Ajusta la distancia desde la parte superior
        left: 40, // Ajusta la distancia desde la izquierda
        right: 45,
        child: Container(
          height: 200, // Ajusta el tamaño aquí
          width: 600, // Ajusta el ancho si es necesario
          decoration: BoxDecoration(
            color: const Color(0xff647749),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const TextField(
            obscureText: false,
            style: TextStyle(
              color: Colors.white,
            ),
            maxLines: null,
            decoration: InputDecoration(
              hintText: "",
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              border: InputBorder.none, // Quitar bordes del TextField
              contentPadding:
                  EdgeInsets.all(20), // Ajustar el relleno del contenido
            ),
          ),
        ),
      ),
    ],
  );
}

Widget campos() {
  return const Stack(
    children: [
      Positioned(
          top: 140, // Aquí puedes ajustar la distancia desde la parte superior
          left: 40, // Puedes ajustar la distancia desde la izquierda
          right: 20,
          child: Text(
            "QUIERO MAS INFORMACIÓN",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 40),
          )),
      Positioned(
          top: 280, // Aquí puedes ajustar la distancia desde la parte superior
          left: 40, // Puedes ajustar la distancia desde la izquierda
          right: 20,
          child: Text(
            "NOMBRE",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
      Positioned(
          top: 420, // Aquí puedes ajustar la distancia desde la parte superior
          left: 40, // Puedes ajustar la distancia desde la izquierda
          right: 20,
          child: Text(
            "CORREO ELECTRÓNICO",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
      Positioned(
          top: 560, // Aquí puedes ajustar la distancia desde la parte superior
          left: 40, // Puedes ajustar la distancia desde la izquierda
          right: 20,
          child: Text(
            "TELEFONO",
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
        top: 1000, // Distancia desde la parte superior
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
            'ENVIAR',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    ],
  );
}
