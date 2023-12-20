import 'package:flutter/material.dart';
import 'package:space_museum/controllers/capsules_controller.dart';
import 'package:space_museum/models/capsules_model.dart';
import 'package:space_museum/views/components/topic_view.dart';

class CapsulesPage extends StatelessWidget {
  CapsulesPage({super.key});

  final CapsulesController _controller = CapsulesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _controller.getCapsules(),
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
            List<CapsuleModel> capsules = snapshot.data as List<CapsuleModel>;

            return Center(
              child: TopicView(imageUrl: 'assets/spacex-capsule.jpg', widgets: [
                const Text(
                  'Capsules',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.start,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: capsules.length,
                    itemBuilder: (context, index) {
                      CapsuleModel capsule = capsules[index];

                      return ListTile(
                        title: Text('status: ${capsule.status}'),
                        subtitle: Text('Reused count: ${capsule.reuseCount}'),
                      );
                    })
              ]),
            );
          }
        },
      ),
    );
  }
}
