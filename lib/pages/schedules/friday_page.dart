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

    for (var i = 0; i < schedule.length; i++) {
      if (schedule[i]["track"] == 1) {
        schedTrack1.add(schedule[i]);
      } else {
        schedTrack2.add(schedule[i]);
      }
    }

    schedTrack1.sort((a, b) => a['time'].compareTo(b['time']));
    schedTrack2.sort((a, b) => a['time'].compareTo(b['time']));

    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Text("Basic Science Track:",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Antifungal Drugs and Resistance",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: [
              ScheduleCard(scheduleItem: schedTrack1[0]),
              ScheduleCard(scheduleItem: schedTrack1[1]),
              ScheduleCard(scheduleItem: schedTrack1[2]),
              const ScheduleCard(scheduleItem: {
                "firstName": "Break",
                "lastName": "",
                "degree": "",
                "title": "",
                "time": 1000
              }),
              ScheduleCard(scheduleItem: schedTrack1[3]),
              ScheduleCard(scheduleItem: schedTrack1[4]),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("Clinical Science Track:",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Immunology and Pathogenesis",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: [
              ScheduleCard(scheduleItem: schedTrack2[0]),
              ScheduleCard(scheduleItem: schedTrack2[1]),
              ScheduleCard(scheduleItem: schedTrack2[2]),
              const ScheduleCard(scheduleItem: {
                "firstName": "Break",
                "lastName": "",
                "degree": "",
                "title": "",
                "time": 1000
              }),
              ScheduleCard(scheduleItem: schedTrack2[3]),
              ScheduleCard(scheduleItem: schedTrack2[4]),
              ScheduleCard(scheduleItem: schedTrack2[5]),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("--Lunch  12:00 - 14:00--",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text("Optional Networking Session",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  leading: Text("13:00 - 14:00",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  subtitle: Text("Scientific Committee Meeting",
                      style: GoogleFonts.raleway(fontSize: 14)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
