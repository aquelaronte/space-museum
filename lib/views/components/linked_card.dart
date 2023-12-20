import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkedCard extends StatelessWidget {
  final String link;
  final String title;
  const LinkedCard({super.key, required this.link, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: SizedBox(
          height: 50,
          width: 350,
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0x22434C59),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: RawMaterialButton(
              onPressed: () {
                launchUrlString(link);
              },
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: title,
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Lato'),
                      ),
                      const WidgetSpan(
                          child: Icon(
                        Icons.arrow_outward,
                        size: 25.0,
                      ))
                    ]),
                  )),
            ),
          ),
        ));
  }
}
