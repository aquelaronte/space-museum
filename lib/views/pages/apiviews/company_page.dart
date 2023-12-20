import 'package:flutter/material.dart';
import 'package:space_museum/models/company_model.dart';
import 'package:space_museum/views/components/linked_card.dart';
import 'package:space_museum/controllers/company_controller.dart';
import 'package:space_museum/views/components/topic_view.dart';

class CompanyPage extends StatelessWidget {
  CompanyPage({super.key});

  final CompanyController _controller = CompanyController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: _controller.getCompany(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error ${snapshot.error}'),
          );
        } else {
          CompanyModel company = snapshot.data as CompanyModel;
          return Center(
              child: TopicView(imageUrl: 'assets/spacex-company.jpg', widgets: [
            Text(
              company.name,
              style: const TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.start,
            ),
            Text(
              '${company.founded}\nBy ${company.founder}',
              style: const TextStyle(fontSize: 12.0, fontFamily: 'Lato'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              company.summary,
              style: const TextStyle(fontFamily: 'Lato'),
            ),
            Text('It count with around ${company.employees} employees'),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Headquarters',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Lato'),
            ),
            Text(
                'Location: ${company.headquarters.city} - ${company.headquarters.state} in ${company.headquarters.address}'),
            const SizedBox(
              height: 25.0,
            ),
            LinkedCard(link: company.links.website, title: 'Visit website'),
            LinkedCard(link: company.links.flickr, title: 'Visit Flickr'),
            LinkedCard(link: company.links.twitter, title: 'Visit Twitter'),
            LinkedCard(
                link: company.links.elonTwitter, title: 'Visit CEO\'s Twitter'),
          ]));
        }
      },
    ));
  }
}
