import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:iccc_app/widgets/schedule_card.dart';

class WednesdayPage extends StatelessWidget {
  final List<Map<String, dynamic>> schedule;
  const WednesdayPage({required this.schedule, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> morningScheduleTrack1 = [];
    List<Map<String, dynamic>> morningScheduleTrack2 = [];
    List<Map<String, dynamic>> eveningSchedule = [];

    for (var i = 0; i < schedule.length; i++) {
      if (schedule[i]["time"] < 1300 && schedule[i]["track"] == 1) {
        morningScheduleTrack1.add(schedule[i]);
      } else if (schedule[i]["time"] < 1300 && schedule[i]["track"] == 2) {
        morningScheduleTrack2.add(schedule[i]);
      } else {
        eveningSchedule.add(schedule[i]);
      }
    }

    morningScheduleTrack1.sort((a, b) => a['time'].compareTo(b['time']));
    morningScheduleTrack2.sort((a, b) => a['time'].compareTo(b['time']));
    eveningSchedule.sort((a, b) => a['time'].compareTo(b['time']));

    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Text("Basic Science - Cell Biology and Development",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: [
              ScheduleCard(scheduleItem: morningScheduleTrack1[0]),
              ScheduleCard(scheduleItem: morningScheduleTrack1[1]),
              ScheduleCard(scheduleItem: morningScheduleTrack1[2]),
              const ScheduleCard(scheduleItem: {
                "firstName": "Break",
                "lastName": "",
                "degree": "",
                "title": "",
                "time": 1000
              }),
              ScheduleCard(scheduleItem: morningScheduleTrack1[3]),
              ScheduleCard(scheduleItem: morningScheduleTrack1[4]),
              ScheduleCard(scheduleItem: morningScheduleTrack1[5]),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("Clinical Science - Disease Manifestations",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: [
              ScheduleCard(scheduleItem: morningScheduleTrack2[0]),
              ScheduleCard(scheduleItem: morningScheduleTrack2[1]),
              ScheduleCard(scheduleItem: morningScheduleTrack2[2]),
              const ScheduleCard(scheduleItem: {
                "firstName": "Break",
                "lastName": "",
                "degree": "",
                "title": "",
                "time": 1000
              }),
              ScheduleCard(scheduleItem: morningScheduleTrack2[3]),
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text(
                      "Panel Discussion: HIV Negative Cryptococcal Meningitis",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  leading: Text("10:45",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Moderators",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                      Text("Olivier Lorthorlary", style: GoogleFonts.raleway()),
                      const SizedBox(height: 5),
                      Text("Panelists",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                      Text("Peter Pappas (MSG and UAB perspective)",
                          style: GoogleFonts.raleway()),
                      Text("Peter Williamson (Inflammatory syndromes)",
                          style: GoogleFonts.raleway()),
                      Text("Olivier Paccoud (HIV- Cryptococcus in France)",
                          style: GoogleFonts.raleway()),
                    ],
                  ),
                ),
              ),
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
                  subtitle: Text("HIV-negative Working Group",
                      style: GoogleFonts.raleway(fontSize: 14)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("Plenary Session - Understanding and Treating Disease",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: [
              ScheduleCard(scheduleItem: eveningSchedule[0]),
              ScheduleCard(scheduleItem: eveningSchedule[1]),
              ScheduleCard(scheduleItem: eveningSchedule[2]),
              const ScheduleCard(scheduleItem: {
                "firstName": "Break",
                "lastName": "",
                "degree": "",
                "title": "",
                "time": 1530
              }),
              ScheduleCard(scheduleItem: eveningSchedule[3]),
              ScheduleCard(scheduleItem: eveningSchedule[4]),
              ScheduleCard(scheduleItem: eveningSchedule[5]),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text("Optional Boat Ride on Lake Victoria",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  leading: Text("17:00 - 18:30",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text("Poster Session",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  leading: Text("18:00 - 19:15",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("--Dinner  19:15 - 20:30--",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
