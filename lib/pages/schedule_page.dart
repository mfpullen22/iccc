import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iccc_app/models/presenter.dart';
import 'package:iccc_app/providers.dart';
import 'package:iccc_app/widgets/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Schedule",
              style: GoogleFonts.raleway(
                  fontSize: 24, fontWeight: FontWeight.bold)),
          automaticallyImplyLeading: false,
        ),
        body: StreamBuilder<List<Presenter>>(
            stream: ref.read(databaseProvider)!.getPresenters(),
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
              final presenters = snapshot.data ?? [];
              List<Map<String, dynamic>> presentersList = [];
              for (var i = 0; i < presenters.length; i++) {
                var item = presenters[i].toMap();
                presentersList.add(item);
              }
              presentersList.sort(
                (a, b) => (a["lastName"]).compareTo(b["lastName"]),
              );
              return ListView.builder(
                  //itemCount: presenters.length,
                  itemCount: presentersList.length,
                  itemBuilder: (context, index) {
                    //final presenter = presenters[index].toMap();
                    return Column(
                      children: [
                        Card(
                          child: Text(presentersList[index]["firstName"] +
                              " " +
                              presentersList[index]["lastName"]),
                        ),
                      ],
                    );
                  });
            }),
        bottomNavigationBar: const BottomNavBarFb5(pageIndex: 1),
      ),
    );
  }
}
