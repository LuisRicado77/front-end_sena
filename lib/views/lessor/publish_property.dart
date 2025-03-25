import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

void main() => runApp(const PublishProperty());

class PublishProperty extends StatefulWidget {
  const PublishProperty({super.key});

  @override
  State<PublishProperty> createState() => _PublishPropertyState();
}

class _PublishPropertyState extends State<PublishProperty> {
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();

  List<File> _images = [];

  Future<void> pickImages() async {
    final List<XFile>? pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      setState(() {
        _images = pickedFiles.map((file) => File(file.path)).toList();
      });
    }
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _numberBathroomsController =
      TextEditingController();
  final TextEditingController _numberRoomsController = TextEditingController();
  final TextEditingController squareMetersController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  String? selectedType;
  String? selectedState;
  String? selectedCity;
  final List<String> propertyTypes = ["Rent", "Sale"];

  final List<String> states = [
    "Amazonas",
    "Antioquia",
    "Arauca",
    "Atlántico",
    "Bolívar",
    "Boyacá",
    "Caldas",
    "Caquetá",
    "Casanare",
    "Cauca",
    "Cesar",
    "Chocó",
    "Córdoba",
    "Cundinamarca",
    "Guainía",
    "Guaviare",
    "Huila",
    "La Guajira",
    "Magdalena",
    "Meta",
    "Nariño",
    "Norte de Santander",
    "Putumayo",
    "Quindío",
    "Risaralda",
    "San Andrés y Providencia",
    "Santander",
    "Sucre",
    "Tolima",
    "Valle del Cauca",
    "Vaupés",
    "Vichada"
  ];

  final List<String> cities = [
    "Armenia",
    "Arauca",
    "Barranquilla",
    "Bogotá",
    "Bucaramanga",
    "Cali",
    "Cartagena",
    "Cúcuta",
    "Florencia",
    "Ibagué",
    "Inírida",
    "Leticia",
    "Manizales",
    "Medellín",
    "Mitú",
    "Mocoa",
    "Montería",
    "Neiva",
    "Pasto",
    "Pereira",
    "Popayán",
    "Puerto Carreño",
    "Quibdó",
    "Riohacha",
    "San Andrés",
    "San José del Guaviare",
    "Santa Marta",
    "Sincelejo",
    "Tunja",
    "Valledupar",
    "Villavicencio",
    "Yopal"
  ];

  Future<List<String>> uploadImages(List<File> images) async {
    const String uploadUrl = "http://192.168.101.100:3001/upload";
    var request = http.MultipartRequest('POST', Uri.parse(uploadUrl));

    for (var image in images) {
      String mimeType = getMimeType(
          image.path); // Función auxiliar para obtener el tipo de archivo

      request.files.add(
        await http.MultipartFile.fromPath(
          'images',
          image.path,
          contentType: MediaType.parse(
              mimeType), // Asegura que se envía el tipo correcto
        ),
      );
    }

    var response = await request.send();
    print("Código de estado: ${response.statusCode}");

    if (response.statusCode == 200) {
      final responseData = jsonDecode(await response.stream.bytesToString());
      print("Respuesta del servidor: $responseData");

      return List<String>.from(
          responseData['imageUrls']); // Asegura que 'imageUrls' es una lista
    } else {
      print(
          "Error en la subida de imágenes: ${await response.stream.bytesToString()}");
      throw Exception("Error al subir imágenes");
    }
  }

// Función auxiliar para obtener el MIME type correcto basado en la extensión
  String getMimeType(String filePath) {
    String extension = filePath.split('.').last.toLowerCase();
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      default:
        return 'application/octet-stream'; // Si no se reconoce, se usa por defecto
    }
  }

  Future<void> _publishProperty() async {
    if (_formKey.currentState!.validate()) {
      try {
        var bathrooms = _numberBathroomsController.text;
        var rooms = _numberRoomsController.text;
        var price = _priceController.text;

        var nPrice = int.tryParse(price) ?? 0;
        var nRooms = int.tryParse(rooms) ?? 0;
        var nBathrooms = int.tryParse(bathrooms) ?? 0;

        print(
            'Tipo de selectedType: ${selectedType.runtimeType}'); // ¿Es String o int?
        print('Tipo de selectedCity: ${selectedCity.runtimeType}');
        print('Tipo de selectedState: ${selectedState.runtimeType}');
        print(
            'Tipo de squareMeters: ${squareMetersController.text.runtimeType}');
        print("rpice: ${nPrice.runtimeType}");
        print("rooms:${nRooms.runtimeType}");
        print("bathrooms_ ${nBathrooms.runtimeType}");
        print("title: ${_titleController.text.runtimeType}");
        print("address: ${_addressController.text.runtimeType}");
        print("country: ${_countryController.text.runtimeType}");
        print("status: ${_statusController.text.runtimeType}");
        print("descripcion: ${_descriptionController.text.runtimeType}");

        // Debugging: Print the values to verify they are correct
        print('Price: $nPrice');
        print('Rooms: $nRooms');
        print('Bathrooms: $nBathrooms');
        print("good: $selectedType");

        // Validate that the values are not null
        if (nPrice == null || nRooms == null || nBathrooms == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
                    "Please enter valid numbers for price, rooms, and bathrooms")),
          );
          return;
        }
        const String apiUrl = "http://192.168.101.100:3001/properties";
        List<String> imageUrls = await uploadImages(_images);
        print("Resultado de uploadImages: $imageUrls");

        print("images: ${imageUrls.runtimeType}");

        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "title": _titleController.text,
            "typeProperty": selectedType,
            "address": _addressController.text,
            "city": selectedCity,
            "state": selectedState,
            "country": _countryController.text,
            "numberRooms": nRooms,
            "numberBathrooms": nBathrooms,
            "squareMeters": squareMetersController.text,
            "rentalPrice": nPrice,
            "status": _statusController.text,
            "description": _descriptionController.text,
            "images": imageUrls ?? "no images"
          }),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Property Created Successfully")),
          );
          _formKey.currentState!.reset();
          setState(() => _images.clear());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to create property")),
          );
        }
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Property")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField("Title", _titleController),
              _buildDropdown("Type", propertyTypes, (value) {
                setState(() => selectedType = value);
              }),
              _buildTextField("Price", _priceController,
                  keyboardType: TextInputType.number),
              _buildTextField("Status", _statusController),
              _buildTextField("Country", _countryController),
              _buildDropdown("State", states, (value) {
                setState(() => selectedState = value);
              }),
              _buildDropdown("City", cities, (value) {
                setState(() => selectedCity = value);
              }),
              _buildTextField("Address", _addressController),
              _buildTextField("Number of Rooms", _numberRoomsController,
                  keyboardType: TextInputType.number),
              _buildTextField("Number of Bathrooms", _numberBathroomsController,
                  keyboardType: TextInputType.number),
              _buildTextField("Description", _descriptionController,
                  maxLines: 3),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: pickImages,
                child: const Text("Select Images"),
              ),
              const SizedBox(height: 10),
              _images.isNotEmpty
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemCount: _images.length,
                      itemBuilder: (context, index) {
                        return Image.file(_images[index], fit: BoxFit.cover);
                      },
                    )
                  : const Text("No images selected"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _publishProperty,
                child: const Text("Publish Property"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter $label";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdown(
      String label, List<String> options, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: options.map((type) {
          return DropdownMenuItem(
            value: type,
            child: Text(type),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) => value == null ? "Please select $label" : null,
      ),
    );
  }
}
