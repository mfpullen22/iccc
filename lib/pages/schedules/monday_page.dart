import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
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

    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Text("Workshop: Population Genetics",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: [
              ScheduleCard(scheduleItem: morningSchedule[0]),
              ScheduleCard(scheduleItem: morningSchedule[1]),
              ScheduleCard(scheduleItem: morningSchedule[2]),
              ScheduleCard(scheduleItem: morningSchedule[3]),
              ScheduleCard(scheduleItem: morningSchedule[4]),
              ScheduleCard(scheduleItem: morningSchedule[5]),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("Clinical Workshop",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text("Treatment Frontiers",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  leading: Text("9:00 - 11:00",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      "Coordinators: David Lawrence MBChB, David Meya MBChB PhD, Joe Jarvis MBBS PhD",
                      style: GoogleFonts.raleway(fontSize: 14)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("--Lunch  12:00 - 13:00--",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text("Genomics Workshop",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: [
              ScheduleCard(scheduleItem: eveningSchedule[0]),
              ScheduleCard(scheduleItem: eveningSchedule[1]),
              ScheduleCard(scheduleItem: eveningSchedule[2]),
              ScheduleCard(scheduleItem: eveningSchedule[3]),
              ScheduleCard(scheduleItem: eveningSchedule[4]),
              const ScheduleCard(
                scheduleItem: {
                  "firstName": "Swim break at the pool!",
                  "lastName": "",
                  "degree": "",
                  "title": "",
                  "time": 1510
                },
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text("Opening Plenary",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: [
              const ScheduleCard(
                scheduleItem: {
                  "firstName": "Welcome Address",
                  "lastName": "",
                  "degree": "",
                  "title": "",
                  "time": 1630
                },
              ),
              ScheduleCard(scheduleItem: eveningSchedule[5]),
              const ScheduleCard(
                scheduleItem: {
                  "firstName": "Welcome Reception",
                  "lastName": "",
                  "degree": "",
                  "title": "",
                  "time": 1830
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}


/* IntrinsicHeight(
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: const Color.fromRGBO(208, 158, 166, 1),
                  child: Column(
                    children: [
                      ScheduleCard(scheduleItem: morningSchedule[0]),
                      ScheduleCard(scheduleItem: morningSchedule[1]),
                      ScheduleCard(scheduleItem: morningSchedule[2]),
                      ScheduleCard(scheduleItem: morningSchedule[0]),
                      ScheduleCard(scheduleItem: morningSchedule[1]),
                      ScheduleCard(scheduleItem: morningSchedule[2]),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: const Color.fromRGBO(243, 238, 217, 1),
                  child: Column(
                    children: [
                      ScheduleCard(scheduleItem: morningSchedule[0]),
                      ScheduleCard(scheduleItem: morningSchedule[1]),
                      ScheduleCard(scheduleItem: morningSchedule[2]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ), */