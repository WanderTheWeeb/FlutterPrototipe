import 'package:MindWell/pages/introscreen/aclaraciones_page.dart';
import 'package:MindWell/pages/introscreen/terms&condition_page.dart';
import 'package:MindWell/pages/introscreen/welcome_page.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

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
                  Tab(text: 'Terminos y condiciones'),
                  Tab(text: 'Aclaraciones'),
                  Tab(text: 'Bienvenido'),
                ],
              ),
            ),
            body: const TabBarView(
              children: [TerminosCondicionesBody(), AclaracionesBody(), BienvenidaBody()],
            )),
      ),
    );
  }
}
