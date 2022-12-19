import "package:flutter/material.dart";
import 'package:iccc_app/widgets/schedule_card.dart';

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
        ScheduleCard(scheduleItem: morningSchedule[0]),
        ScheduleCard(scheduleItem: eveningSchedule[0])
      ],
    );
  }
}
