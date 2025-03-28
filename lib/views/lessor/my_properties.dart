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

  int? userId;
  int? rolId;
  List<Map<String, dynamic>> properties = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
     loadUserData();
    print("Iniciando fetchProperties...");
    fetchProperties();
   
     
  }

Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('idUser');
      rolId = prefs.getInt('idRol');
      print(userId);
      print(rolId);
    });
    if (userId != null) {
    fetchProperties(); // Solo se ejecuta cuando ya tienes el userId
  } else {
    print("Error: No hay idUser guardado en SharedPreferences");
  }
  }



  Future<void> fetchProperties() async {
    try {
      final String idUser;
    if(userId == null) {
      print('Error: No hay idUser guardado');
      return;
    }else{
       idUser = userId.toString();
    }
    print('http://192.168.101.100:3001/properties/lessor/$userId');
    print('http://192.168.101.100:3001/properties/lessor/$idUser');
    
      final response =
          await http.get(Uri.parse('http://192.168.101.100:3001/properties/lessor/$userId'));;

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
            Text('Type: \ ${property['typeProperty']}',
                style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
            Text('Address: \ ${property['address']}',
                style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
            Text('City: \ ${property['city']}',
                style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
            Text('State: \ ${property['state']}',
                style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
            Text('Country: \$${property['conutry']}',
                style: TextStyle(fontSize: 18)),
                 SizedBox(height: 10),
            Text('Zip Code: \ ${property['zipcode']}',
                style: TextStyle(fontSize: 18)),
                 SizedBox(height: 10),
            Text('Rooms: \ ${property['numberRooms']}',
                style: TextStyle(fontSize: 18)),
                 SizedBox(height: 10),
            Text('Bathrooms: \ ${property['numberBathrooms']}',
                style: TextStyle(fontSize: 18)),
                 SizedBox(height: 10),
            Text('Square Meters: \ ${property['squareMeters']}',
                style: TextStyle(fontSize: 18)),
                 SizedBox(height: 10),
            Text('Precio: \$${property['rentalPrice']}',
                style: TextStyle(fontSize: 18)),
                 SizedBox(height: 10),
            Text('Imagenes: \ ${property['images']}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Detalles:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(property['description'], style: TextStyle(fontSize: 16)),
             SizedBox(height: 10),
            Text('Status:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(property['status'], style: TextStyle(fontSize: 16)),
            
          ],
        ),
      ),
    );
  }
}
