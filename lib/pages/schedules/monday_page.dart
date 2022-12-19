import "package:flutter/material.dart";

class MondayPage extends StatelessWidget {
  final List<Map<String, dynamic>> schedule;
  const MondayPage({required this.schedule, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> morningSchedule = [];
    List<Map<String, dynamic>> eveningSchedule = [];

    for (var i = 0; i < schedule.length; i++) {
      if (schedule[i]["time"] < 1300) {
        morningSchedule.add(schedule[i]);
      } else {
        eveningSchedule.add(schedule[i]);
      }
    }

    morningSchedule.sort((a, b) => a['time'].compareTo(b['time']));
    eveningSchedule.sort((a, b) => a['time'].compareTo(b['time']));

    return Column(
      children: [
        Card(
          child: Text(morningSchedule[0]["lastName"] +
              " - " +
              morningSchedule[0]["time"].toString() +
              " - " +
              morningSchedule[0]["title"]),
        ),
        Card(
          child: Text(eveningSchedule[0]["lastName"] +
              " - " +
              eveningSchedule[0]["time"].toString() +
              " - " +
              eveningSchedule[0]["title"]),
        )
      ],
    );
  }
}
