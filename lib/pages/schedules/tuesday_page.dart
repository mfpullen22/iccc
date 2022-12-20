import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:iccc_app/widgets/schedule_card.dart';

class TuesdayPage extends StatelessWidget {
  final List<Map<String, dynamic>> schedule;
  const TuesdayPage({required this.schedule, Key? key}) : super(key: key);

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
        Text("Basic Science - Species and Phenotypes",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(208, 158, 166, 1),
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
        Text("Clinical Science - CrAg Screening",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(209, 231, 224, 1),
          child: Column(
            children: [
              ScheduleCard(scheduleItem: morningScheduleTrack2[0]),
              Card(
                child: ListTile(
                  title: Text("Panel Discussion: Optimizing Preemptive Therapy",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  leading: Text("8:45",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Moderators",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                      Text("Tom Harrison, David Boulware",
                          style: GoogleFonts.raleway()),
                      const SizedBox(height: 5),
                      Text("Panelists",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                      Text("Sile Molloy (EFFECT Trial)",
                          style: GoogleFonts.raleway()),
                      Text("Radha Rajasingham (ACACIA Trial)",
                          style: GoogleFonts.raleway()),
                      Text("Elizabeth Nalintya (ENCORE Trial)",
                          style: GoogleFonts.raleway()),
                      Text("Tshiama Miriam Mwamba (NICD)",
                          style: GoogleFonts.raleway())
                    ],
                  ),
                ),
              ),
              const ScheduleCard(scheduleItem: {
                "firstName": "Break",
                "lastName": "",
                "degree": "",
                "title": "",
                "time": 1000
              }),
              ScheduleCard(scheduleItem: morningScheduleTrack2[1]),
              Card(
                child: ListTile(
                  title: Text(
                      "Panel Discussion: Programmatic and Implementation Issues on CrAg Screening",
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
                      Text("Tom Chiller, David Meya",
                          style: GoogleFonts.raleway()),
                      const SizedBox(height: 5),
                      Text("Panelists",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                      Text("Katy Godfrey (PEPFAR)",
                          style: GoogleFonts.raleway()),
                      Text("Nelesh Govender (South Africa)",
                          style: GoogleFonts.raleway()),
                      Text("Elizabeth Nalintya (Uganda)",
                          style: GoogleFonts.raleway()),
                      Text("Master Chisale (Malawi)",
                          style: GoogleFonts.raleway()),
                      Text("Boniface Ocora (Lira, Uganda)",
                          style: GoogleFonts.raleway()),
                      Text("Tafese Beyene Tufa (Ethiopia)",
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
          color: const Color.fromRGBO(208, 158, 166, 1),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: Text("Optional Networking Session",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  leading: Text("13:00 - 14:00",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  subtitle: Text("CrAg Screening Working Group",
                      style: GoogleFonts.raleway(fontSize: 14)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("Plenary Session 2 - Treatment Strategies",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(209, 231, 224, 1),
          child: Column(
            children: [
              ScheduleCard(scheduleItem: eveningSchedule[0]),
              ScheduleCard(scheduleItem: eveningSchedule[1]),
              ScheduleCard(scheduleItem: eveningSchedule[2]),
              ScheduleCard(scheduleItem: eveningSchedule[3]),
              ScheduleCard(scheduleItem: eveningSchedule[4]),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("Evening Poster Session",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(208, 158, 166, 1),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: Text("Poster Flash Talks",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  leading: Text("16:45 - 18:00",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
        Container(
          color: const Color.fromRGBO(208, 158, 166, 1),
          child: Column(
            children: [
              Card(
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
