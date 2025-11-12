import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Course.dart';

class ExamDetailScreen extends StatelessWidget {
  final Course exam;

  const ExamDetailScreen({
    super.key,
    required this.exam,
  });

  String _getTimeRemaining() {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);

    if (difference.isNegative) {
      final pastDifference = now.difference(exam.dateTime);
      final days = pastDifference.inDays;
      final hours = pastDifference.inHours % 24;
      return 'Поминат пред $days дена, $hours часа';
    }

    final days = difference.inDays;
    final hours = difference.inHours % 24;
    return '$days дена, $hours часа';
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy (EEEE)', 'mk');
    final timeFormat = DateFormat('HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Информации за испит'),
        backgroundColor: Colors.deepPurple[600],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4,
                color: exam.isPassed ? Colors.grey[300] : Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.book,
                            size: 32,
                            color: exam.isPassed ? Colors.grey[700] : Colors.deepPurple[400],
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              exam.subject,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: exam.isPassed ? Colors.grey[700] : Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildDetailRow(
                        Icons.calendar_today,
                        'Датум',
                        dateFormat.format(exam.dateTime),
                      ),
                      const SizedBox(height: 16),
                      _buildDetailRow(
                        Icons.access_time,
                        'Време',
                        timeFormat.format(exam.dateTime),
                      ),
                      const SizedBox(height: 16),
                      _buildDetailRow(
                        Icons.room,
                        'Лаборатории',
                        exam.rooms.join(', '),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                  width: 320,
                  child: Card(
                    elevation: 4,
                    color: exam.isPassed ? Colors.red[200] : Colors.green[200],
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Icon(
                            exam.isPassed ? Icons.check_circle : Icons.timer,
                            size: 48,
                            color: exam.isPassed ? Colors.red : Colors.green,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            exam.isPassed ? 'Поминат испит' : 'Преостанува',
                            style: TextStyle(
                              fontSize: 16,
                              color: exam.isPassed ? Colors.red[700] : Colors.green[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _getTimeRemaining(),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: exam.isPassed ? Colors.red[900] : Colors.green[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: exam.isPassed ? Colors.grey[600] : Colors.deepPurple[400],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: exam.isPassed ? Colors.grey[700] : Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
