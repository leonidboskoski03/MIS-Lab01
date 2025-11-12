import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Course.dart';

class ExamCard extends StatelessWidget {
  final Course exam;
  final VoidCallback onTap;

  const ExamCard({
    super.key,
    required this.exam,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: exam.isPassed ? Colors.grey[600] : Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exam.subject,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: exam.isPassed ? Colors.grey[700] : Colors.black87,
                  decoration: exam.isPassed ? TextDecoration.lineThrough : null,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: exam.isPassed ? Colors.grey[600] : Colors.blue,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    dateFormat.format(exam.dateTime),
                    style: TextStyle(
                      fontSize: 14,
                      color: exam.isPassed ? Colors.grey[600] : Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.access_time,
                    size: 16,
                    color: exam.isPassed ? Colors.grey[600] : Colors.blue,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    timeFormat.format(exam.dateTime),
                    style: TextStyle(
                      fontSize: 14,
                      color: exam.isPassed ? Colors.grey[600] : Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.room,
                    size: 16,
                    color: exam.isPassed ? Colors.grey[600] : Colors.green,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      exam.rooms.join(', '),
                      style: TextStyle(
                        fontSize: 14,
                        color: exam.isPassed ? Colors.grey[600] : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}