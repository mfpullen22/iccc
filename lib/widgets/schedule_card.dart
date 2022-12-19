import "package:flutter/material.dart";

class ScheduleCard extends StatelessWidget {
  final Map<String, dynamic> scheduleItem;
  const ScheduleCard({required this.scheduleItem, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(scheduleItem["lastName"] +
          " " +
          scheduleItem["degree"] +
          " - " +
          scheduleItem["time"].toString() +
          " - " +
          scheduleItem["title"]),
    );
  }
}
