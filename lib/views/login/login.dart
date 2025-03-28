import 'package:app_sena/views/lessor/main_page_lessor.dart';
import 'package:app_sena/views/login/create_account.dart';
import 'package:app_sena/views/login/forget_password.dart';
import 'package:app_sena/views/tenant/find_property.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login(String email, String password) async {
    const String apiUrl = "http://192.168.101.100:3001/users/login";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("Datos recibidos del servidor: $data");
        int userId = data['idUser'] ?? 0; // ID del usuario
        int rolId = data['idRol'] ?? 0; // ID del rol
        print("Usuario ID: $userId, Rol ID: $rolId");
        // Guardar en SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('idUser', userId);
        await prefs.setInt('idRol', rolId);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Access granted")),
        );
        print("Login exitoso: ${data['token']}");
        //final String token = data['token'];
        final int idRol = data['idRol'];

        if (rolId == 2) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Access granted")),
          );
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const MainPageLessor()));
        } else if (idRol == 1) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Access granted")),
          );
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const FindProperty()));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Access Denied")),
        );
        print("Error en login: ${response.body}");
      }
    } catch (e) {
      print("Error de conexión: $e");
    }
  }

  Future<Map<String, String?>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('idUser');
    int? rolId = prefs.getInt('idRol');

    print("Recuperado - Usuario ID: $userId, Rol ID: $rolId");

    return {
      'idUser': userId.toString(),
      'idRol': rolId.toString(),
    };
  }

  Future<void> _crearCuenta() async {
    try {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const CreateAccount()));
    } catch (e) {
      print("Error de conexión: $e");
    }
  }

  Future<void> _forgotPassword() async {
    try {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ForgotPassword()));
    } catch (e) {
      print("Error de conexion: $e");
    }
  }

  String? validatePasswordAndEmail(String? value) {
    if (value == null || value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Empty Fields")),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff545454),
      body:
          //color: const Color(0xff87ba42),
          SingleChildScrollView(
        padding: const EdgeInsets.all(60),
        child: Column(
          children: [
            // Logo y título
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
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),

            // Campos de texto
            const Text(
              "CORREO",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: validatePasswordAndEmail,
              controller: _usernameController,
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
            const SizedBox(height: 20),
            const Text(
              "CONTRASEÑA",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: !_passwordVisible,
              validator: validatePasswordAndEmail,
              controller: _passwordController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                //labelText: "Password",
                filled: true,
                fillColor: const Color(0xff647749),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
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
              onPressed: () =>
                  _login(_usernameController.text, _passwordController.text),
              child: const Text(
                'INGRESAR',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Enlaces de "Olvidó su contraseña?" y "Crear cuenta"
            ElevatedButton(
              onPressed: _forgotPassword,
              child: const Text(
                '¿Olvidó su contraseña?',
                selectionColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _crearCuenta,
              child: const Text('Crear cuenta!'),
            ),
          ],
        ),
      ),
    );
  }
}
