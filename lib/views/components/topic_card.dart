import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  final dynamic widgetPage;
  final String title;
  const TopicCard({super.key, required this.widgetPage, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: SizedBox(
          height: 100,
          width: 400,
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0x22434C59),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: RawMaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => widgetPage));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Lato'),
                    ),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: 'See more information ',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lato',
                              color: Colors.white)),
                      WidgetSpan(
                          child: Icon(
                        Icons.arrow_outward_rounded,
                        size: 25.0,
                      ))
                    ]))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
