class CapsuleModel {
  final String id;
  final String status;
  final String type;
  final int reuseCount;

  CapsuleModel(
      {required this.id,
      required this.status,
      required this.type,
      required this.reuseCount});

  static CapsuleModel fromMap({required Map map}) => CapsuleModel(
      id: map['id'],
      status: map['status'],
      type: map['type'],
      reuseCount: map['reuse_count']);
}
