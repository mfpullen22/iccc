import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:iccc_app/widgets/schedule_card.dart';

class MondayPage extends StatelessWidget {
  final List<Map<String, dynamic>> schedule;
  //final List<Map<String, dynamic>> locations;
  const MondayPage({required this.schedule, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> morningSchedule = [];
    List<Map<String, dynamic>> eveningSchedule = [];
    List<Map<String, dynamic>> plenarySchedule = [];
/*     List<Map<String, dynamic>> locations = [];
    String morningLoc = "";
    String lunchLoc = "";
    String eveningLoc = "";
    String plenaryLoc = "";
    String dinnerLoc = "";

    for(var i = 0; i < locations.length; i++) {
      if(locations[i]["session"] == "morning") {
        morningLoc = locations[i]["location"];
      }
      if(locations[i]["session"] == "lunch") {
        lunchLoc = locations[i]["location"];
      }
      if(locations[i]["session"] == "evening") {
        eveningLoc = locations[i]["plenary"];
      }
      if(locations[i]["session"] == "plenary") {
        plenaryLoc = locations[i]["location"];
      }
      if(locations[i]["session"] == "dinner") {
        dinnerLoc = locations[i]["location"];
      }
    }   */

    for (var i = 0; i < schedule.length; i++) {
      if (schedule[i]["time"] < 1300) {
        morningSchedule.add(schedule[i]);
      } 
      if (schedule[i]["track"] == 4) {
        plenarySchedule.add(schedule[i]);
      } 
      if (schedule[i]["time"] >= 1300 && schedule[i]["track"] != 4) {
        eveningSchedule.add(schedule[i]);
      }
    }

    morningSchedule.sort((a, b) => a['time'].compareTo(b['time']));
    eveningSchedule.sort((a, b) => a['time'].compareTo(b['time']));
    plenarySchedule.sort((a, b) => a['time'].compareTo(b['time']));

    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Text("Genetics and Genomics Workshop",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text('Location: Victoria Ballroom',
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: <Widget> [
              /* ScheduleCard(scheduleItem: morningSchedule[0]),
              ScheduleCard(scheduleItem: morningSchedule[1]),
              ScheduleCard(scheduleItem: morningSchedule[2]),
              ScheduleCard(scheduleItem: morningSchedule[3]), */
              /* Container(
                color:  const Color.fromRGBO(117, 16, 62, 1),
                child: Column(
                children: [
                  Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text("ISHAM Working Group Discussion",
                          style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                      leading: Text("11:30",
                          style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          "Led by: Wielend Meyer PhD and Carolina Firacative PhD",
                          style: GoogleFonts.raleway(fontSize: 14)),
                    ),
                  )
            ],
          ),
        ), */              
        for(var item in morningSchedule) ScheduleCard(scheduleItem: item),
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
        Text("Clinical Workshop",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Location: Victoria Ballroom",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: <Widget> [     
            for(var item in eveningSchedule) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
        /* Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text("Treatment Frontiers",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  leading: Text("13:00 - 16:00",
                      style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      "Coordinators: David Lawrence MBChB, David Meya MBChB PhD, Joe Jarvis MBBS PhD",
                      style: GoogleFonts.raleway(fontSize: 14)),
                ),
              )
            ],
          ),
        ), */
        const SizedBox(height: 10),
        Text("Opening Plenary",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Location: Victoria Ballroom",
            textAlign: TextAlign.center,
            style:
                GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold)),
        Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: <Widget> [     
            for(var item in plenarySchedule) ScheduleCard(scheduleItem: item),
            ],
          ),
        ),
        /* Container(
          color: const Color.fromRGBO(117, 16, 62, 1),
          child: Column(
            children: const [
               ScheduleCard(
                scheduleItem: {
                  "firstName": "Welcome Address",
                  "lastName": "",
                  "degree": "",
                  "title": "",
                  "time": 1630
                },
              ),
              ScheduleCard(
                scheduleItem: {
                  "firstName": "Tom",
                  "lastName": "Chiller",
                  "degree": "MD",
                  "title": "Keynote Address",
                  "time": 1700
                },
              ),
            ],
          ),
        ), */
        const SizedBox(height: 10),
        Container(
          color: const Color.fromRGBO(0, 192, 225, 1),
          child: Column(
            children: const [
               ScheduleCard(
                scheduleItem: {
                  "firstName": "Welcome Reception",
                  "lastName": "",
                  "degree": "",
                  "title": "Location: Poolside",
                  "time": 1830
                },
               ),
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