import 'package:flutter/material.dart';

class TopicView extends StatelessWidget {
  final String imageUrl;
  final List<Widget> widgets;
  const TopicView({super.key, required this.imageUrl, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text(''),
          backgroundColor: Colors.black,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverFixedExtentList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(children: widgets),
              )
            ]),
            itemExtent: 420.0)
      ],
    );
  }
}
