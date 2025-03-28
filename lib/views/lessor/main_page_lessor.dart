import 'package:app_sena/views/lessor/messages.dart';
import 'package:app_sena/views/lessor/my_properties.dart';
import 'package:app_sena/views/lessor/notifications.dart';
import 'package:app_sena/views/lessor/publish_property.dart';
import 'package:app_sena/views/lessor/request.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainPageLessor());

class MainPageLessor extends StatelessWidget {
  const MainPageLessor({super.key});

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
                    'assets/images/edificioverde.png',
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
              top: 550,
              left: 45,
              child: bottom(context,"Publicar propiedad"),
            ),
            Positioned(
              top: 650,
              left: 45,
              child: bottom(context,"Mis propiedades"),
            ),
            Positioned(
              top: 750,
              left: 45,
              child: bottom(context,"Solicitudes"),
            ),
            Positioned(
              top: 850,
              left: 45,
              child: bottom(context,"Notificaciones"),
            ),
            Positioned(
              top: 950,
              left: 45,
              child: bottom(context,"Mensajes"),
            ),
            Positioned(
              top:
                  410, // Ajustamos para darle más margen desde la parte superior
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

Widget bottom(BuildContext context,String mensaje) {
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
      if(mensaje == "Publicar propiedad"){      
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PublishProperty()));
      }else if(mensaje == "Mis propiedades"){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyProperties()));
      }else if(mensaje == "Solicitudes"){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RequestView()));
      }else if(mensaje == "Notificaciones"){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NotificationsView()));
      }else if(mensaje == "Mensajes"){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MessagesView()));
      }else{
        print("nothing");
      }
    },
    child: Text(
      mensaje,
      style: const TextStyle(
        fontSize: 20,
      ),
    ),
  );
}
