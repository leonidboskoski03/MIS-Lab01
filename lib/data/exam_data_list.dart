import '../models/Course.dart';

List<Course> getExams() {
  return [
    Course(
      subject: 'Мобилни информациски системи',
      dateTime: DateTime(2025, 11, 22, 9, 0),
      rooms: ['215', 'Амфитеатар ТМФ'],
    ),
    Course(
      subject: 'Веб дизајн',
      dateTime: DateTime(2025, 11, 14, 13, 30),
      rooms: ['138'],
    ),
    Course(
      subject: 'Бази на податоци',
      dateTime: DateTime(2025, 11, 27, 11, 0),
      rooms: ['2', '12'],
    ),
    Course(
      subject: 'Структурно програмирање',
      dateTime: DateTime(2025, 11, 17, 10, 0),
      rooms: ['13', '2'],
    ),
    Course(
      subject: 'Алгоритми и податочни структури',
      dateTime: DateTime(2025, 11, 25, 9, 30),
      rooms: ['215', 'Амфитеатар МФ'],
    ),
    Course(
      subject: 'Калкулус',
      dateTime: DateTime(2025, 11, 19, 8, 30),
      rooms: ['Амфитеатар Ф'],
    ),
    Course(
      subject: 'Веројатност и статистика',
      dateTime: DateTime(2025, 11, 26, 12, 0),
      rooms: ['200АБ', 'Амфитеатар МФ'],
    ),
    Course(
      subject: 'Дискретна математика',
      dateTime: DateTime(2025, 11, 21, 14, 0),
      rooms: ['215'],
    ),
    Course(
      subject: 'Напреден веб дизајн',
      dateTime: DateTime(2025, 11, 24, 11, 0),
      rooms: ['3', '200АБ'],
    ),
    Course(
      subject: 'Програмски парадигми',
      dateTime: DateTime(2025, 11, 28, 10, 30),
      rooms: ['12', '138'],
    ),
    Course(
      subject: 'Дискретни структури 2',
      dateTime: DateTime(2025, 11, 16, 9, 0),
      rooms: ['200В', '215'],
    ),
  ]..sort((a, b) => a.dateTime.compareTo(b.dateTime));
}
