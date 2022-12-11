import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iccc_app/models/presentation.dart';
import 'package:iccc_app/providers.dart';
import 'package:iccc_app/widgets/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iccc_app/widgets/scheduleStream.dart';
import 'package:iccc_app/widgets/tabbar.dart';

class SchedulePage extends ConsumerStatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SchedulePageState();
}

class _SchedulePageState extends ConsumerState<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    var fullSchedule = ref.read(databaseProvider)?.getPresentations("10");
    var monSchedule = [];
    fullSchedule!.forEach((k) => monSchedule.add(k));
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Schedule",
                style: GoogleFonts.raleway(
                    fontSize: 24, fontWeight: FontWeight.bold)),
            automaticallyImplyLeading: false,
            bottom: TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                color: Colors.white,
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: const [
                Tab(
                  child: Text("Jan 9"),
                ),
                Tab(
                  child: Text("Jan 10"),
                ),
                Tab(
                  child: Text("Jan 11"),
                ),
                Tab(
                  child: Text("Jan 12"),
                ),
                Tab(
                  child: Text("Jan 13"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: ScheduleStream(day: "9"),
              ),
              Center(
                child: ScheduleStream(day: "10"),
              ),
              Center(
                child: ScheduleStream(day: "11"),
              ),
              Center(
                child: ScheduleStream(day: "12"),
              ),
              Center(
                child: ScheduleStream(day: "13"),
              ),
            ],
          ),
          bottomNavigationBar: const BottomNavBarFb5(pageIndex: 1),
        ),
      ),
    );
  }
}

/* StreamBuilder<List<Presentation>>(
            stream: ref.read(databaseProvider)?.getPresentations(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                      "Something went wrong! Are you connected to the internet?"),
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final presentations = snapshot.data ?? [];
              List<Map<String, dynamic>> presentationsList = [];
              for (var i = 0; i < presentations.length; i++) {
                var item = presentations[i].toMap();
                presentationsList.add(item);
              }
              presentationsList.sort(
                (a, b) => (a["day"]).compareTo(b["day"]),
              );
              return ListView.builder(
                  //itemCount: presenters.length,
                  itemCount: presentationsList.length,
                  itemBuilder: (context, index) {
                    //final presenter = presenters[index].toMap();
                    return Column(
                      children: [
                        Card(
                          child: Text(presentationsList[index]["lastName"] +
                              " " +
                              presentationsList[index]["day"] +
                              " - " +
                              presentationsList[index]["time"]),
                        ),
                      ],
                    );
                  });
            }), */
