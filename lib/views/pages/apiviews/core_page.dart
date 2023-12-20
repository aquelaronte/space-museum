import 'package:flutter/material.dart';
import 'package:space_museum/controllers/core_controller.dart';
import 'package:space_museum/models/core_model.dart';
import 'package:space_museum/views/components/topic_view.dart';

class CorePage extends StatelessWidget {
  CorePage({super.key});

  final CoreController _controller = CoreController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _controller.getCores(),
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
                List<CoreModel> cores = snapshot.data as List<CoreModel>;

                return Center(
                  child:
                      TopicView(imageUrl: 'assets/spacex-core.jpg', widgets: [
                    const Text(
                      'Cores',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.start,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: cores.length,
                        itemBuilder: (context, index) {
                          CoreModel core = cores[index];

                          return ListTile(
                            title: Text('status: ${core.status}'),
                            subtitle: Text(
                                'Reused count: ${core.block != null ? '${core.block}' : 'unknown'}'),
                          );
                        })
                  ]),
                );
              }
            }));
  }
}
