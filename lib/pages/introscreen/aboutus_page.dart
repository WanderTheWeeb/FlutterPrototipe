import 'package:MindWell/utils/my_widgets/TextSectionV1.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Acerca de MindWell'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Nosotros'),
                Tab(text: 'Mision y Visión'),
                Tab(text: 'Filosofía'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                padding: const EdgeInsets.all(15),
                children: [
                  const CircleAvatar(
                    radius: 170,
                    backgroundImage: AssetImage(
                      'assets/logo/MindWell.png',
                    ),
                  ),
                  TextSectionV1('Acerca de MindWell',
                      'MindWell es una empresa creada por alumnos de la Universidad Veracruzana de la licenciatura en ingeniería en software, licenciatura en contaduría y licenciatura en gestión y dirección de negocios. Surgida de la necesidad de brindar atención psicológica dejando atrás las barreras de lenguaje y estigma que prevalece sobre la salud mental.'),
                ],
              ),
              ListView(padding: const EdgeInsets.all(15), children: [
                TextSectionV1('Misión',
                    'MindWell es una empresa dedicada a brindar atención psicológica oportuna, eficaz e integral a cualquier persona que lo necesite. Estamos comprometidos a impulsar la accesibilidad de atención psicológica'),
                TextSectionV1('Visión',
                    'Posicionarnos como una aplicación líder en temas de salud mental. Atendiendo las necesidades de las personas que busquen atención psicológica, siendo reconocidos a nivel nacional e internacional por ser una empresa que rompe las barreras del lenguaje y los posibles estigmas relacionados con buscar ayuda psicológica'),
                TextSectionV1('Conoce nuestra imagen',
                    'La palabra MindWell significa mente sana en inglés. El color azul representa un sentimiento de confianza, honestidad, fiabilidad, calidad y seguridad, estos valores le vienen muy bien a MindWell, debido a los objetivos que se buscan, como lo son el dar una atención psicológica de calidad y buscando siempre el confort de los usuarios que utilicen nuestros servicios.')
              ]),
              ListView(
                padding: const EdgeInsets.all(15),
                children: [
                  Container(
                    height: 150,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Salud.jpg'))),
                  ),
                  TextSectionV1('Fílosofia',
                      'MindWell es una empresa que prevalece con el valor de la empatía, pues reconocemos las dificultades que cada persona atraviesa derivado del poco acceso que hoy en día se tiene a una atención psicológica digna y respetuosa.')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
