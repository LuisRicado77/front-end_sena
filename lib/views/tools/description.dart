import 'package:flutter/material.dart';

void main() => runApp(const DescriptionProperty());

class DescriptionProperty extends StatelessWidget {
  const DescriptionProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      title: "description",
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
  final ScrollController _scrollController = ScrollController();

  final List<String> images = [
    'assets/images/casalist1.jpg',
    'assets/images/casalist2.jpg',
    'assets/images/casalist3.jpg',
    'assets/images/casalist4.jpg',
  ];
  bool isLiked = false;

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 200, // Desplaza 200px a la derecha
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 200, // Desplaza 200px a la izquierda
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF87ba42),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Image.asset(
                'assets/icons/user.png',
                fit: BoxFit.contain,
                height: 50,
              ),
              onPressed: () {
                print("Botón izquierdo presionado");
              },
            ),
            IconButton(
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.grey,
                size: 50,
              ),
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _scrollLeft,
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: _scrollRight,
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Lista horizontal de imágenes
              SizedBox(
                height: 300, // Altura fija para el contenedor de imágenes
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: 300, // Ancho de la imagen
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          const Positioned(top: 400, left: 10, child: Text("Description")),
          const Positioned(top: 440, left: 10, child: Text("Price")),
          const Positioned(top: 480, left: 10, child: Text("Ubication")),
          Positioned(
              top: 520,
              left: 20,
              child: _buildIconWithText(icon: Icons.bed, label: '3 hab')),
          Positioned(
              top: 520,
              left: 200,
              child: _buildIconWithText(icon: Icons.shower, label: '1 baño')),
          Positioned(
              top: 520,
              left: 390,
              child:
                  _buildIconWithText(icon: Icons.square_foot, label: '2m^2')),
          Positioned(
              top: 605,
              left: 15,
              child: _buildDetailBox("Tipo de vivienda:", "Arriendo")),
          Positioned(
              top: 605,
              left: 290,
              child: _buildDetailBox("Tipo de Operación:", "Arriendo")),
          Positioned(
              top: 690,
              left: 15,
              child: _buildDetailBox("Estrato:", "Arriendo")),
          Positioned(
              top: 690,
              left: 290,
              child: _buildDetailBox("Año de construcción:", "Arriendo")),
          Positioned(
            top: 970, // Ajusta la posición vertical
            left: 20, // Ajusta la posición horizontal
            child: button("Llamar", 0xFF87ba42, 40, 200),
          ),
          Positioned(
            top: 970, // Ajusta la posición vertical
            left: 300, // Ajusta la posición horizontal
            child: button("Whatsapp", 0xFF87ba42, 40, 200),
          ),
        ],
      ),
    );
  }
}

Widget button(String name, int color, double height, double width) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(width, height),
      backgroundColor: Color(color),
      foregroundColor: Colors.white,
      disabledBackgroundColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide.none,
      ),
    ),
    onPressed: () {
      print("Botón presionado: $name");
    },
    child: Text(
      name,
      style: const TextStyle(
        fontSize: 20,
      ),
    ),
  );
}

Widget _buildIconWithText({required IconData icon, required String label}) {
  return Column(
    children: [
      Icon(
        icon,
        size: 40,
        color: Colors.grey[700],
      ),
      const SizedBox(height: 5),
      Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ],
  );
}

Widget _buildDetailBox(String title, String value) {
  return Container(
    height: 80,
    width: 210,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
        ),
      ],
    ),
  );
}
