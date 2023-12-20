class Distance {
  final double meters;
  final double feet;

  Distance({required this.meters, required this.feet});

  static Distance fromMap({required Map map}) =>
      Distance(meters: map['meters'].toDouble(), feet: map['feet'].toDouble());
}

class DragonModel {
  final String id;
  final bool active;
  final int crewCapacity;
  final String description;
  final Distance diameter;
  final int dryMassKg;
  final int dryMassLb;
  final String firstFlight;
  final String name;
  final String type;
  final String wikipedia;

  DragonModel(
      {required this.id,
      required this.active,
      required this.crewCapacity,
      required this.description,
      required this.diameter,
      required this.dryMassKg,
      required this.dryMassLb,
      required this.firstFlight,
      required this.name,
      required this.type,
      required this.wikipedia});

  static DragonModel fromMap({required Map map}) {
    return DragonModel(
      id: map['id'],
      active: map['active'],
      crewCapacity: map['crew_capacity'],
      description: map['description'],
      diameter: Distance.fromMap(map: map['diameter']),
      dryMassKg: map['dry_mass_kg'],
      dryMassLb: map['dry_mass_lb'],
      firstFlight: map['first_flight'],
      name: map['name'],
      type: map['type'],
      wikipedia: map['wikipedia'],
    );
  }
}
