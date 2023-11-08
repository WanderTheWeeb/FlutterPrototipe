import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterPsiPage extends StatefulWidget {
  const RegisterPsiPage({super.key});

  @override
  _RegisterPsiPageState createState() => _RegisterPsiPageState();
}

class _RegisterPsiPageState extends State<RegisterPsiPage> {
  String _selectedSpeciality = 'Psicología';

  // Define una lista de especialidades de psicólogos para el menú desplegable.
  final List<String> _specialities = [
    'Psicología',
    'Psicología Clínica',
    'Psicología Educativa',
    'Otra'
  ];

  DateTime? _birthdate;
  final dateFormat = DateFormat('dd/MM/yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro de usuario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(labelText: 'Nombre Completo'),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onTap: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _birthdate ?? DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),

                      );

                      if (pickedDate != null && pickedDate != _birthdate) {
                        setState(() {
                          _birthdate = pickedDate;
                        });
                      }
                    },
                    readOnly: true,
                    controller: TextEditingController(text: _birthdate != null ? dateFormat.format(_birthdate!) : ''),
                    decoration: const InputDecoration(labelText: 'Fecha de Nacimiento'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    decoration: const InputDecoration(labelText: 'Género'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(labelText: 'Teléfono'),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) {},
              decoration:
              const InputDecoration(labelText: 'Cédula Profesional'),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              value: _selectedSpeciality,
              items: _specialities.map((speciality) {
                return DropdownMenuItem(
                  value: speciality,
                  child: Text(speciality),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedSpeciality = value.toString();
                });
              },
              decoration: const InputDecoration(labelText: 'Especialidad'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Subir Documento de Identidad'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}