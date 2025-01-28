import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FindProperty());

class FindProperty extends StatelessWidget {
  const FindProperty({super.key});

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
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color(0xFF545454), // Color de fondo similar al de la imagen
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Distribuye los elementos
          children: [
            IconButton(
              icon: Image.asset(
                'assets/icons/window.png',
                fit: BoxFit.contain,
                height: 50,
              ),

              // Imagen del botón izquierdo
              onPressed: () {
                // Acción del botón izquierdo
                print("Botón izquierdo presionado");
              },
            ),
            const Text(
              "sugerencias de hoy",
              style:
                  TextStyle(color: Colors.white), // Personalización del texto
            ),
            IconButton(
              icon: Image.asset(
                'assets/icons/user.png',
                fit: BoxFit.contain,
                height: 50,
              ),
              // Imagen del botón derecho
              onPressed: () {
                // Acción del botón derecho
                print("Botón derecho presionado");
              },
            ),
          ],
        ),
      ),
      body: Container(
          color: const Color(0xFF545454),
          child: Stack(children: <Widget>[
            search(_controller),
            Positioned(
              top: 35,
              left: 400,
              right: 20,
              child: IconButton(
                icon: Image.asset(
                  'assets/icons/filter.png',
                  fit: BoxFit.contain,
                  height: 50,
                ),
                onPressed: () {},
              ),
            ),
            Positioned(
              top: 120,
              left: 20,
              child: Transform.rotate(
                angle: 0,
                child: Container(
                  width: 453,
                  height: 190,
                  //color: const Color(0xFF87ba42),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFF87ba42)),
                ),
              ),
            ),
            Positioned(
              top: 140,
              left: 30,
              child: Image.asset(
                'assets/images/housewithman.png',
                fit: BoxFit.contain,
                height: 170,
              ),
            ),
            const Positioned(
              top: 200,
              left: 250,
              child: Text(
                "Adquiere tu casa \n sin tanto complique!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Positioned(
              top: 330,
              left: 20,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(140, 60),
                    backgroundColor: const Color.fromARGB(
                        249, 0, 0, 0), // Color de fondo del botón
                    foregroundColor: Colors.white, // Color del texto
                    disabledBackgroundColor:
                        Colors.grey, // Color cuando el botón está deshabilitado

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide.none)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/todotrasparente.png',
                      height: 50,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text("All")
                  ],
                ),
              ),
            ),
            Positioned(
              top: 330,
              left: 175,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(140, 60),
                    backgroundColor: const Color(0xff87ba42),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide.none)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/comprartrasparente.png',
                      height: 50,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text("Buy")
                  ],
                ),
              ),
            ),
            Positioned(
              top: 330,
              left: 330,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(140, 60),
                    backgroundColor: const Color(0xff87ba42),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide.none)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/alquilartransparente.png',
                      height: 50,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text("Rent")
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                    height: 50), // Un widget superior, si lo necesitas
                const Text(
                  "Catálogo",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(height: 340),
                Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  padding: const EdgeInsets.all(20),
                  children: [
                    chart('assets/images/casa1.jpg', 'Venta de casa barrio...',
                        230000.00, 4.5, context),
                    chart('assets/images/casa1.jpg', 'Casa en alquiler...',
                        2700.00, 3.5, context),
                    chart('assets/images/casa1.jpg', 'Venta de apartamento...',
                        250000.00, 4.0, context),
                    chart('assets/images/casa1.jpg',
                        'Venta o alquiler de casa...', 2950.00, 5.0, context),
                    chart('assets/images/casa1.jpg',
                        'Venta: sector del parque...', 170750.00, 4.5, context),
                    chart('assets/images/casa1.jpg', 'Alquiler de casa en...',
                        2250.00, 3.0, context),
                  ],
                ))
              ],
            ),
          ])),
    );
  }
}

Widget search(TextEditingController controller) {
  return Stack(
    children: [
      Positioned(
          top: 30, // Aquí puedes ajustar la distancia desde la parte superior
          left: 20, // Puedes ajustar la distancia desde la izquierda
          right:
              150, // Ajusta para darle espacio desde la derecha si es necesario
          child: SizedBox(
            child: TextField(
              controller: controller,
              obscureText: false,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
                labelText: 'search',
                filled: true,
                fillColor: Color(0xffffffff),
                border: OutlineInputBorder(),
              ),
            ),
          )),
    ],
  );
}

Widget chart(String foto, String description, double price, double rate,
    BuildContext context) {
  // String info = description;
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(200, 60),
        backgroundColor: const Color(0xff87ffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Bordes redondeados
        ),
      ),
      onPressed: () {},
      child: Container(
        width: 250,
        child: Column(children: [
          Image.asset(
            foto,
            height: 100,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(description),
          Text(price.toString()),
          RatingBar.builder(
            initialRating: rate,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) =>
                Icon(Icons.star, color: Color(0xff87ba42)),
            onRatingUpdate: (newRating) {
              print(newRating);
            },
          ),
        ]),
      ));
}
