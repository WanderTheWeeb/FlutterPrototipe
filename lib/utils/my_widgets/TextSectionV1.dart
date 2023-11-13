import 'package:flutter/material.dart';

Widget TextSectionV1(String title, String text) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SectionTitle(title),
            const Divider(thickness: 1),
            const SizedBox(height: 16),
            SectionText(text),
            const SizedBox(height: 16),
          ]),
        ),
      ),
    ],
  );
}

Widget TextSectionV2(String title, String subtitle, String text, String price) {
  return ListView(
    children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SectionTitle(title),
                Text(price)
              ],
            ),
            const Divider(thickness: 1),
            const SizedBox(height: 16),
            SectionSubtitle(subtitle),
            const SizedBox(height: 16),
            SectionText(text),
            const SizedBox(height: 24),
                Center(child: ElevatedButton(onPressed: () {}, child: const Text('¡Suscribirse!')))

          ]),
        ),
      ),
    ],
  );
}

class SectionSubtitle extends StatelessWidget {
  final String subtitle;

  const SectionSubtitle(this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor),
    );
  }
}

class SectionText extends StatelessWidget {
  final String text;

  const SectionText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
      textAlign: TextAlign.justify,
    );
  }
}
