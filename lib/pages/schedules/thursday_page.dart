import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:iccc_app/widgets/schedule_card.dart';

class ThursdayPage extends StatelessWidget {
  final List<Map<String, dynamic>> schedule;
  const ThursdayPage({required this.schedule, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> morningSchedule = [];
    List<Map<String, dynamic>> eveningScheduleTrack1 = [];
    List<Map<String, dynamic>> eveningScheduleTrack2 = [];

    for (var i = 0; i < schedule.length; i++) {
      if (schedule[i]["time"] > 1300 && schedule[i]["track"] == 1) {
        eveningScheduleTrack1.add(schedule[i]);
      } else if (schedule[i]["time"] > 1300 && schedule[i]["track"] == 2) {
        eveningScheduleTrack2.add(schedule[i]);
      } else {
        morningSchedule.add(schedule[i]);
      }
    }

    eveningScheduleTrack1.sort((a, b) => a['time'].compareTo(b['time']));
    eveningScheduleTrack2.sort((a, b) => a['time'].compareTo(b['time']));
    morningSchedule.sort((a, b) => a['time'].compareTo(b['time']));

    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Text("Plenary Session:",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Drug Development and Clinical Trials",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: [
              const ScheduleCard(scheduleItem: {
                "firstName": "Announcement - Vote for 2026 Venue",
                "lastName": "",
                "degree": "",
                "title": "",
                "time": 800
              }),
              ScheduleCard(scheduleItem: morningSchedule[0]),
              ScheduleCard(scheduleItem: morningSchedule[1]),
              ScheduleCard(scheduleItem: morningSchedule[2]),
              const ScheduleCard(scheduleItem: {
                "firstName": "Break",
                "lastName": "",
                "degree": "",
                "title": "",
                "time": 1000
              }),
              ScheduleCard(scheduleItem: morningSchedule[3]),
              ScheduleCard(scheduleItem: morningSchedule[4]),
              ScheduleCard(scheduleItem: morningSchedule[5]),
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
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text("Optional Networking Session",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  leading: Text("13:00 - 14:00",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  subtitle: Text("Career Development",
                      style: GoogleFonts.raleway(fontSize: 14)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("Basic Science Track:",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Genetics and Reproduction",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: [
              ScheduleCard(scheduleItem: eveningScheduleTrack1[0]),
              ScheduleCard(scheduleItem: eveningScheduleTrack1[1]),
              ScheduleCard(scheduleItem: eveningScheduleTrack1[2]),
              const ScheduleCard(scheduleItem: {
                "firstName": "Break",
                "lastName": "",
                "degree": "",
                "title": "",
                "time": 1530
              }),
              ScheduleCard(scheduleItem: eveningScheduleTrack1[3]),
              ScheduleCard(scheduleItem: eveningScheduleTrack1[4]),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("Clinical Science Track:",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Ancillary Treatment Strategies",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: [
              ScheduleCard(scheduleItem: eveningScheduleTrack2[0]),
              ScheduleCard(scheduleItem: eveningScheduleTrack2[1]),
              Card(
                elevation: 10,
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Audience Discussion:",
                          style:
                              GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                      Text("Altered Mental Status",
                          style:
                              GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  leading: Text("10:45",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Goal",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                      Text(
                          "Determine clinical best practices and research agendas",
                          style: GoogleFonts.raleway()),
                    ],
                  ),
                ),
              ),
              ScheduleCard(scheduleItem: eveningScheduleTrack2[2]),
              Card(
                elevation: 10,
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Panel Discussion",
                          style:
                              GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                      Text("Scheduled Therapeutic LPs",
                          style:
                              GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  leading: Text("10:45",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Moderators",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                      Text("Mahsa Abassi", style: GoogleFonts.raleway()),
                      const SizedBox(height: 5),
                      Text("Panelists",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                      Text("David Meya", style: GoogleFonts.raleway()),
                      Text("Peter Pappas", style: GoogleFonts.raleway()),
                      Text("Methee Chayakulkeeree",
                          style: GoogleFonts.raleway()),
                      Text("Angela Loyse", style: GoogleFonts.raleway()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: Text("Closing Reception",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  leading: Text("18:30 - 20:00",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
