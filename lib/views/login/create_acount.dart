import 'dart:convert';

import 'package:app_sena/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const CreateAcount());

class CreateAcount extends StatefulWidget {
  const CreateAcount({super.key});

  @override
  State<CreateAcount> createState() => _InicioState();
}

class _InicioState extends State<CreateAcount> {
  String? selectedRol;
  int? selectedRolId;
  String? selectedState;
  String? selectedCity;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  final TextEditingController _namesController = TextEditingController();
  final TextEditingController _lastNamesController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  // final TextEditingController _cityController = TextEditingController();
  //final TextEditingController _stateController = TextEditingController();

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Enter a password";
    if (value.length < 8) return "Password must be at least 8 characters";
    return null;
  }

  void _register() {
    if (_passwordController.text != _passwordConfirmController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }
    _createUser();
  }

  //options
  final Map<String, int> rolesMap = {
    "Tenant": 1,
    "Lessor": 2,
  };

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

  Future<void> _createUser() async {
    const String apiUrl = "http://192.168.101.93:3001/users";
    try {
      final response = await http.post(Uri.parse(apiUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "names": _namesController.text,
            "lastNames": _lastNamesController.text,
            "email": _emailController.text,
            "password": _passwordController.text,
            "phone": _phoneController.text,
            "address": _addressController.text,
            "city": selectedCity,
            "state": selectedState,
            "idRol": selectedRolId
          }));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("user created with success");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User Created")),
        );
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Login()));
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
        backgroundColor: const Color(0xff545454),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(60),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/edificioverde.png',
                width: 60,
                height: 60,
              ),
              const SizedBox(height: 10),
              const Text(
                'CASA SINU',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "names: ",
                style: TextStyle(color: Color(0xff87ba42)),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _namesController,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 50),
              const Text(
                "Last Names: ",
                style: TextStyle(color: Color(0xff87ba42)),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _lastNamesController,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 50),
              const Text(
                "Email: ",
                style: TextStyle(color: Color(0xff87ba42)),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _emailController,
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 50),
              const Text(
                "Password: ",
                style: TextStyle(color: Color(0xff87ba42)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                validator: validatePassword,
                controller: _passwordController,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 50),
              const Text(
                "Confirm Passwrod: ",
                style: TextStyle(color: Color(0xff87ba42)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: !_passwordVisible,
                validator: validatePassword,
                controller: _passwordConfirmController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(),
              ),
              const SizedBox(height: 50),
              const Text(
                "Phone: ",
                style: TextStyle(color: Color(0xff87ba42)),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _phoneController,
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 50),
              const Text(
                "Address: ",
                style: TextStyle(color: Color(0xff87ba42)),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _addressController,
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 50),
              const Text(
                "State: ",
                style: TextStyle(color: Color(0xff87ba42)),
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                  value: selectedState,
                  items: states.map((String state) {
                    return DropdownMenuItem<String>(
                        value: state, child: Text(state));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedState = newValue;
                      print(selectedState);
                    });
                  }),
              const SizedBox(height: 50),
              const Text(
                "City: ",
                style: TextStyle(color: Color(0xff87ba42)),
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                  value: selectedCity,
                  items: cities.map((String state) {
                    return DropdownMenuItem<String>(
                        value: state, child: Text(state));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCity = newValue;
                      print(selectedCity);
                    });
                  }),
              const SizedBox(height: 50),
              const Text(
                "Rol: ",
                style: TextStyle(color: Color(0xff87ba42)),
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                  value: selectedRol,
                  items: rolesMap.keys.map((String role) {
                    return DropdownMenuItem<String>(
                        value: role, child: Text(role));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRol = newValue;
                      selectedRolId = rolesMap[newValue];
                      print(selectedRolId);
                    });
                  }),

              const SizedBox(height: 30),

              // Botón de ingresar
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 70),
                  backgroundColor: const Color(0xff87ba42),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide.none,
                  ),
                ),
                onPressed: _register,
                child: const Text(
                  'Crear Cuenta',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

Widget mainText() {
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

Widget password() {
  return Stack(
    children: [
      Positioned(
        top: 890, // Aquí puedes ajustar la distancia desde la parte superior
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
          top: 750, // Aquí puedes ajustar la distancia desde la parte superior
          left: 40, // Puedes ajustar la distancia desde la izquierda
          right: 20,
          child: Text(
            "EMAIL",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
      Positioned(
          top: 860, // Aquí puedes ajustar la distancia desde la parte superior
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
          onPressed: () {},
          child: const Text(
            'CREAR',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    ],
  );
}
