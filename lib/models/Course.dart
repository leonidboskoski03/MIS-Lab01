class Course {
  final String subject;
  final DateTime dateTime;
  final List<String> rooms;

  Course({
    required this.subject,
    required this.dateTime,
    required this.rooms,
  });

  bool get isPassed => dateTime.isBefore(DateTime.now());
}