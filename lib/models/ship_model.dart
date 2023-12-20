class ShipModel {
  final bool active;
  final int? clas;
  final String homePort;
  final String id;
  final String? image;
  final String name;
  final List roles;
  final String type;
  final int? yearBuilt;

  ShipModel(
      {required this.active,
      required this.clas,
      required this.homePort,
      required this.id,
      required this.image,
      required this.name,
      required this.roles,
      required this.type,
      required this.yearBuilt});

  static ShipModel fromMap({required Map map}) => ShipModel(
      active: map['active'],
      clas: map['class'],
      homePort: map['home_port'],
      id: map['id'],
      image: map['image'],
      name: map['name'],
      roles: map['roles'],
      type: map['type'],
      yearBuilt: map['year_built']);
}
