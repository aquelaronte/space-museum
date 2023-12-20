class CoreModel {
  final String id;
  final int? block;
  final String status;
  final int reuseCount;

  CoreModel(
      {required this.id,
      required this.block,
      required this.status,
      required this.reuseCount});

  static CoreModel fromMap({required Map map}) => CoreModel(
      id: map['id'],
      block: map['block'],
      status: map['status'],
      reuseCount: map['reuse_count']);
}
