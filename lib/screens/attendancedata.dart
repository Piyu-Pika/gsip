import 'package:flutter/material.dart';


class AttendanceDataScreen extends StatelessWidget {
  final List<Map<String, dynamic>> attendanceData;

  AttendanceDataScreen({required this.attendanceData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: attendanceData.length,
          itemBuilder: (context, index) {
            final data = attendanceData[index];
            return ListTile(
              title: Text('Latitude: ${data['latitude']}, Longitude: ${data['longitude']}'),
              subtitle: Text('Check-in Time: ${data['checkinTime']}\nCheck-out Time: ${data['checkoutTime']}'),
            );
          },
        ),
      ),
    );
  }
}