import 'package:MindWell/utils/my_widgets/TextSectionV1.dart';
import 'package:flutter/material.dart';

class Bienvenida extends StatelessWidget {
  const Bienvenida({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(child: Text('Bienvenido a MindWell')),
        ),
        body: const BienvenidaBody());
  }
}

class BienvenidaBody extends StatelessWidget {
  const BienvenidaBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          Center(child: SectionTitle('Tu Espacio de Bienestar Mental')),
          SizedBox(height: 16),
          SectionText(
              'En MindWell, nuestra misión es proporcionarte las herramientas y el apoyo necesario para que puedas cuidar de tu salud mental de la manera más eficaz y comprensiva. Reconocemos que la salud mental es una parte esencial de tu bienestar general, y estamos comprometidos a ayudarte a superar las barreras que puedan dificultar el acceso a la atención psicológica de calidad. Por ello, hemos creado esta app para alcanzarte a ti y a los que necesiten un sitio donde conseguir ayuda sin obstáculos.'),
          SizedBox(height: 16),
          Image.asset('assets/images/logo/MindWell.png', scale: 100),
        ]));
  }
}
