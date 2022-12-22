import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iccc_app/models/presentation.dart';
import 'package:iccc_app/pages/abstract_details_page.dart';
import 'package:iccc_app/providers.dart';
import 'package:iccc_app/widgets/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class AbstractsPage extends ConsumerWidget {
  const AbstractsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Abstracts",
                  style: GoogleFonts.raleway(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              Text("Tap an abstract to view details",
                  style: GoogleFonts.raleway(
                      fontSize: 14, fontWeight: FontWeight.bold))
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: StreamBuilder<List<Presentation>>(
            stream: ref.read(databaseProvider)!.getPresentations("0"),
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
              List<Map<String, dynamic>> presentationList = [];
              for (var i = 0; i < presentations.length; i++) {
                var item = presentations[i].toMap();
                if (item["firstName"] == "TBD") {
                  continue;
                }
                if (item["title"] == "Introduction" ||
                    item["title"] == "Panelist" ||
                    item["title"] == "Moderator") {
                  continue;
                }
                presentationList.add(item);
              }
              presentationList.sort(
                (a, b) => (a["lastName"]).compareTo(b["lastName"]),
              );
              return ListView.builder(
                  itemCount: presentationList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          elevation: 5,
                          color: presentationList[index]["oral"] == "y"
                              ? const Color.fromRGBO(209, 231, 224, 1)
                              : const Color.fromRGBO(208, 158, 166, 1),
                          child: ListTile(
                            leading: presentationList[index]["oral"] == "y"
                                ? Text("Oral",
                                    style: GoogleFonts.raleway(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold))
                                : Text("Poster",
                                    style: GoogleFonts.raleway(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold)),
                            title: Text(
                                presentationList[index]["firstName"] +
                                    " " +
                                    presentationList[index]["lastName"] +
                                    " " +
                                    presentationList[index]["degree"],
                                style: GoogleFonts.raleway(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            subtitle: Text(presentationList[index]["title"],
                                style: GoogleFonts.raleway(fontSize: 14)),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AbstractDetailsPage(
                                    name: presentationList[index]["firstName"] +
                                        " " +
                                        presentationList[index]["lastName"],
                                    university: presentationList[index]
                                        ["employer"],
                                    title: presentationList[index]["title"],
                                    abs: presentationList[index]["abs"],
                                    oral: presentationList[index]["oral"],
                                    day: presentationList[index]["day"],
                                    time: presentationList[index]["time"],
                                    degree: presentationList[index]["degree"],
                                    imageName: presentationList[index]
                                        ["lastName"],
                                    email: presentationList[index]["email"],
                                    position: presentationList[index]
                                        ["position"],
                                    totalList: presentationList,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  });
            }),
        bottomNavigationBar: const BottomNavBarFb5(pageIndex: 3),
      ),
    );
  }
}
