import 'package:MindWell/utils/constants.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new)),
                      IconButton(
                          onPressed: () {
                            // Mostrar un cuadro de diálogo de confirmación
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Cerrar sesión'),
                                  content: const Text(
                                      '¿Estás seguro de que quieres cerrar sesión?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(
                                            context); // Cerrar el cuadro de diálogo
                                      },
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        await supabase.auth.signOut();
                                        Navigator.pushNamed(context, '/RegisterScreen');
                                      },
                                      child: const Text('Aceptar'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }, icon: const Icon(Icons.logout)),
                    ])),
            const SizedBox(height: 16),
            const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/logo/MindWell.png',
                ),
                radius: 100),
            const SizedBox(height: 16),
            const Divider(thickness: 1, color: Colors.white),
            const ListTile(
                leading: Icon(Icons.message), title: Text('Mensajes')),
            const ListTile(
                leading: Icon(Icons.groups), title: Text('Organcizaciones')),
            ListTile(
              leading: const Icon(Icons.emoji_people),
              title: const Text('Acerca de Nosotros'),
              onTap: () {
                Navigator.pushNamed(context, '/AboutUs');
              },
            )
          ],
        ),
      ),
    );
  }
}
