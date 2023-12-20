import 'package:flutter/material.dart';
import 'package:space_museum/controllers/dragon_controller.dart';
import 'package:space_museum/models/dragon_model.dart';
import 'package:space_museum/views/components/linked_card.dart';
import 'package:space_museum/views/components/topic_view.dart';

class DragonPage extends StatelessWidget {
  DragonPage({super.key});

  final DragonController _controller = DragonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _controller.getDragons(),
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
              List<DragonModel> dragons = snapshot.data as List<DragonModel>;

              return Center(
                child:
                    TopicView(imageUrl: 'assets/spacex-dragon.jpg', widgets: [
                  const Text(
                    'Dragons (tap for details)',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: dragons.length,
                    itemBuilder: (context, index) {
                      DragonModel dragon = dragons[index];

                      return ListTile(
                        title: Text(dragon.name),
                        subtitle: Text(dragon.type),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                  color: const Color(0x2207091F),
                                  child: SizedBox(
                                    height: 500,
                                    width: 350,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          dragon.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18.0),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        Text(
                                          dragon.description,
                                          textAlign: TextAlign.center,
                                        ),
                                        Text('type: ${dragon.type}'),
                                        Text(
                                            'status: ${dragon.active ? 'active' : 'inactive'}'),
                                        Text(
                                            'first flight at: ${dragon.firstFlight}'),
                                        Text(
                                            'weight: ${dragon.dryMassKg}kg | ${dragon.dryMassLb}lb'),
                                        Text('capacity ${dragon.crewCapacity}'),
                                        const SizedBox(
                                          height: 25.0,
                                        ),
                                        LinkedCard(
                                            link: dragon.wikipedia,
                                            title: 'Visit wikipedia')
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                            },
                          );
                        },
                      );
                    },
                  )
                ]),
              );
            }
          }),
    );
  }
}
