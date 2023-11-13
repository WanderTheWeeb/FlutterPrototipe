import 'package:MindWell/utils/my_widgets/TextSectionV1.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PricePage extends StatelessWidget {
  const PricePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suscripciones'),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/logo/MindWellComplete.png'))),
          ),
              Center(
                child: CarouselSlider(
                items: [
                  TextSectionV2("Suscripcion mensual","Descubrimiento Personal", "Bienvenido a nuestro Plan Mensual Descubrimiento Personal. Este plan está diseñado para aquellos que desean explorar y abordar desafíos específicos de manera más extensa. Con sesiones individuales a lo largo del mes, tendrás el tiempo necesario para profundizar en tus preocupaciones y trabajar en soluciones efectivas. Este plan es perfecto para quienes buscan un enfoque más constante y sostenible para su bienestar mental.","\$90"),
                  TextSectionV2("Suscripcion semestral","Transformación Continua", "Sumérgete en un viaje transformador con nuestro Plan Semestral Transformación Continua. Este plan está diseñado para brindarte un apoyo sólido a lo largo del tiempo, permitiéndote abordar y superar obstáculos de manera gradual y sostenible. Con sesiones regulares y recursos personalizados, este plan te ayudará a crear cambios significativos en tu vida.","\$486"),
                  TextSectionV2("Suscripcion anual","Bienestar Integral", "Prioriza tu bienestar mental y emocional con nuestro Plan Anual Bienestar Integral, Este plan ofrece un compromiso a largo plazo para fortalecer tu salud mental en todas las áreas de tu vida. Con sesiones regulares, un enfoque holístico y acceso exclusivo a programas especializados, este plan te guiará en la creación de una base sólida para tu bienestar a lo largo del año.","\$864"),
                ].map((section) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration:  BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2.0,
                          ),
                        ),
                        child: section,
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 500,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                  viewportFraction: 0.8,
                )),
              ),
            ],
      ),
    );
  }
}
