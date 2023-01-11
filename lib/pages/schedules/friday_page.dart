import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:iccc_app/widgets/schedule_card.dart';

class FridayPage extends StatelessWidget {
  final List<Map<String, dynamic>> schedule;
  const FridayPage({required this.schedule, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> schedTrack1 = [];
    List<Map<String, dynamic>> schedTrack2 = [];
    List<Map<String, dynamic>> optionalSchedule = [];
    List<Map<String, dynamic>> closingSchedule = [];

    for (var i = 0; i < schedule.length; i++) {
      if (schedule[i]["track"] == 1) {
        schedTrack1.add(schedule[i]);
      } 
      if (schedule[i]["track"] == 2) {
        schedTrack2.add(schedule[i]);
      }
      if (schedule[i]["track"] == 3) {
        optionalSchedule.add(schedule[i]);
      }
      if (schedule[i]["track"] == 4) {
        closingSchedule.add(schedule[i]);
      }
    }

    schedTrack1.sort((a, b) => a['time'].compareTo(b['time']));
    schedTrack2.sort((a, b) => a['time'].compareTo(b['time']));
    optionalSchedule.sort((a, b) => a['time'].compareTo(b['time']));
    closingSchedule.sort((a, b) => a['time'].compareTo(b['time']));

    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Text("Basic Science - Antifungal Drugs and Resistance",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Location: Albert Hall",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold)),
        Text("Moderator: Asiya Gusa",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16)),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: <Widget> [     
            for(var item in schedTrack1) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("Clinical Science - Immunology and Pathogenesis",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Location: Victoria Ballroom",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Moderator: Michal Olszewski",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16)),
        Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: <Widget> [     
            for(var item in schedTrack2) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: <Widget> [     
            for(var item in closingSchedule) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("-Lunch: Stables Restaurant-",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("12:00 - 14:00",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: <Widget> [     
            for(var item in optionalSchedule) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
      ],
    );
  }
}
