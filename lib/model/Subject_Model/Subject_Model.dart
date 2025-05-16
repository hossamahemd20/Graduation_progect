class SubjectModel {
  final int id;
  final String subjectName;
  final int levelId;
  final DateTime createdAt;
  final DateTime updatedAt;

  SubjectModel({
    required this.id,
    required this.subjectName,
    required this.levelId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'],
      subjectName: json['subject_name'] ?? 'No Name',
      levelId: json['level_id'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subject_name': subjectName,
      'level_id': levelId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}