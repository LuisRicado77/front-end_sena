import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyProperties());

class MyProperties extends StatefulWidget {
  const MyProperties({super.key});

  @override
  State<MyProperties> createState() => _MyPropertiesState();
}

class _MyPropertiesState extends State<MyProperties> {
  List<Map<String, dynamic>> properties = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    print("Iniciando fetchProperties...");
    fetchProperties(); // Llama a la API al iniciar la pantalla
     
  }

  Future<void> saveUserData(String token, String idUser) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
  await prefs.setString('idUser', idUser);
}



  Future<void> fetchProperties() async {
    try {
    final prefs = await SharedPreferences.getInstance();
    final String? idUser = prefs.getString('idUser');  // ← Obtener idUser guardado
    print('ID del usuario: $idUser');
    if (idUser == null) {
      print('Error: No hay idUser guardado');
      return;
    }
      final response =
          await http.get(Uri.parse('http://192.168.101.100:3001/properties/lessor/$idUser'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
          print("Datos recibidos: $data"); 

        setState(() {
          properties =
              data.map((prop) => prop as Map<String, dynamic>).toList();
          isLoading = false;
        });
      } else {
        print('Error al cargar propiedades. Código: ${response.statusCode}');
        throw Exception('Error al cargar propiedades');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void deleteProperty(int id) {
    setState((){
      properties.removeWhere((prop) => prop['id'] == id);
    });
    print('Casa eliminada con id: $id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Propiedades ')),
      body: properties.isEmpty
          ? Center(
              child:
                  CircularProgressIndicator()) // Muestra un loader mientras carga
          :properties.isEmpty
          ?Center(child: Text("Noy hay propiedades disponibles"),)
          : ListView.builder(
              itemCount: properties.length,
              itemBuilder: (context, index) {
                final property = properties[index];

                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(property['title']),
                    subtitle: Text('\$${property['price']} por mes'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PropertyDetailScreen(property: property),
                        ),
                      );
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteProperty(property['id']),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class PropertyDetailScreen extends StatelessWidget {
  final Map<String, dynamic> property;

  PropertyDetailScreen({required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(property['title'])),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(property['title'],
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Precio: \$${property['price']}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Detalles:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(property['details'], style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
