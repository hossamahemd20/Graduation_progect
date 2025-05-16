class Task {
  final String filePath;

  Task({required this.filePath});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      filePath: json['task'], // دي أهم نقطة
    );
  }
}
