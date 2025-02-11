import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void main() => runApp(const PublishProperty());

class PublishProperty extends StatefulWidget {
  const PublishProperty({super.key});

  @override
  State<PublishProperty> createState() => _PublishPropertyState();
}

class _PublishPropertyState extends State<PublishProperty> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  //final TextEditingController _cityController = TextEditingController();
  //final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _numberBathroomsController =
      TextEditingController();
  final TextEditingController _numberRoomsController = TextEditingController();
  final TextEditingController squareMetersController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _pictureController = TextEditingController();

  String? selectedType;
  String? selected;
  String? selectedState;
  String? selectedCity; // "Rent" or "Sale"
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
    " San José del Guaviare",
    "San José de Cúcuta",
    " Santa Marta",
    "Sincelejo",
    "Tunja",
    "Valledupar",
    "Villavicencio",
    "Yopal"
  ];

  Future<void> _publishProperty() async {
    try {
      const String apiUrl = "http://192.168.101.93:3001/properties";
      final response = await http.post(Uri.parse(apiUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "title": _titleController.text,
            "propertyType": selectedType,
            "address": _addressController.text,
            "city": selectedCity,
            "state": selectedState,
            "country": selectedState,
            "numberRooms": _numberRoomsController.text,
            "numberBathrooms": _numberBathroomsController.text,
            "squareMeters": squareMetersController.text,
            "rentalPrice": _priceController.text,
            "status": _statusController.text,
            "description": _descriptionController.text,
            "pictures": _pictureController.text
          }));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("user publish with success");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Property Created")),
        );
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const PublishProperty()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Empty fields")),
        );
        print("There is a error in the database");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(title: Text("Add Property")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField("Title", _titleController),
              _buildDropdown("Type", propertyTypes, (value) {
                setState(() {
                  selectedType = value;
                });
              }),
              _buildTextField("Price", _priceController,
                  keyboardType: TextInputType.number),
              _buildTextField("Country", _countryController),
              _buildDropdown("State", states, (value2) {
                setState(() {
                  selectedState = value2;
                });
              }),
              _buildDropdown("City", cities, (value3) {
                setState(() {
                  selectedCity = value3;
                });
              }),
              _buildTextField("Address", _addressController),
              _buildTextField("Number of Rooms", _numberRoomsController,
                  keyboardType: TextInputType.number),
              _buildTextField("Number of Bathrooms", _numberBathroomsController,
                  keyboardType: TextInputType.number),
              _buildTextField("Description", _descriptionController,
                  maxLines: 3),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text("Publish Property"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para un campo de texto
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
        value: selected,
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

  // Enviar formulario
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print("Property Added: ${_titleController.text}, Type: $selectedType");
      _publishProperty;
      // Aquí podrías enviar los datos a tu backend
    }
    ;
  }
}
