import 'package:flutter/material.dart';

class LoginOrg extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginOrg> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iniciar sesión"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Correo Electrónico',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                  ),
                  obscureText: true, // Para ocultar la contraseña
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Aquí puedes agregar la lógica para verificar el inicio de sesión
                    String username = _usernameController.text;
                    String password = _passwordController.text;

                    if (username == 'usuario' && password == 'contraseña') {
                      Navigator.pushNamed(context, '/RoomPage');
                    } else {
                      // Muestra un mensaje de error
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.warning,
                              color: Colors.yellowAccent,
                            ),
                            Text('Credenciales incorrectas'),
                          ],
                        ),
                      ));
                    }
                  },
                  child: const Text('Iniciar Sesión'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromRGBO(0, 0, 0, 1.0),
                    backgroundColor: const Color.fromRGBO(
                        255, 255, 255, 1.0), // Color del texto
                  ),
                  onPressed: () {
                    // Aquí puedes agregar la lógica para iniciar sesión con Google
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Centra los elementos horizontalmente
                    mainAxisSize: MainAxisSize
                        .min, // Permite que el botón se adapte al contenido
                    children: [
                      Image.asset('assets/images/key.png',
                          scale:
                              25), // Asegúrate de tener la imagen en la ubicación correcta
                      const SizedBox(
                          width:
                              8), // Agrega un espacio entre la imagen y el texto
                      const Text('Iniciar Sesión con cuenta de organización'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/RegisterPsiScreen');
                    // Aquí puedes agregar la lógica para redirigir al usuario a la pantalla de registro
                  },
                  child: const Text('¿No tienes una cuenta? Regístrate'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
