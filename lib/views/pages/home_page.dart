import 'package:flutter/material.dart';
import 'package:space_museum/controllers/auth.dart';
import 'package:space_museum/views/components/topic_card.dart';
import 'package:space_museum/views/pages/apiviews/core_page.dart';
import 'package:space_museum/views/pages/apiviews/ships_page.dart';
import 'package:space_museum/views/pages/apiviews/dragon_page.dart';
import 'package:space_museum/views/pages/apiviews/company_page.dart';
import 'package:space_museum/views/pages/apiviews/capsules_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> signOut() async {
    Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(18.0),
        children: <Widget>[
          TopicCard(widgetPage: CompanyPage(), title: 'Company'),
          const Divider(
            thickness: 0.5,
          ),
          TopicCard(widgetPage: ShipsPage(), title: 'Ships'),
          const Divider(
            thickness: 0.5,
          ),
          TopicCard(widgetPage: CorePage(), title: 'Cores'),
          const Divider(
            thickness: 0.5,
          ),
          TopicCard(
            widgetPage: CapsulesPage(),
            title: 'Capsules',
          ),
          const Divider(
            thickness: 0.5,
          ),
          TopicCard(widgetPage: DragonPage(), title: 'Dragons'),
          const Divider(
            thickness: 1,
          ),
          FilledButton(onPressed: signOut, child: const Text('Sign out'))
        ],
      ),
    );
  }
}
