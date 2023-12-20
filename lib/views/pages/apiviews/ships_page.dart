import 'package:flutter/material.dart';
import 'package:space_museum/controllers/ship_controller.dart';
import 'package:space_museum/models/ship_model.dart';
import 'package:space_museum/views/components/topic_view.dart';

class ShipsPage extends StatelessWidget {
  ShipsPage({super.key});

  final ShipController _controller = ShipController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _controller.getShips(),
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
              List<ShipModel> ships = snapshot.data as List<ShipModel>;

              return Center(
                child: TopicView(
                  imageUrl: 'assets/spacex-ships.jpg',
                  widgets: [
                    const Text(
                      'Ships (tap for details)',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.start,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: ships.length,
                      itemBuilder: (context, index) {
                        ShipModel ship = ships[index];

                        return ListTile(
                          title: Text(ship.name),
                          subtitle: Text(ship.homePort),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                    child: Card(
                                  child: SizedBox(
                                    height: 200,
                                    width: 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(ship.name),
                                        Text(ship.homePort),
                                        Text('type: ${ship.type}'),
                                        Text(
                                            'status: ${ship.active ? 'active' : 'inactive'}'),
                                        Text(
                                            'built at ${ship.yearBuilt ?? "unknown"}')
                                      ],
                                    ),
                                  ),
                                ));
                              },
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
