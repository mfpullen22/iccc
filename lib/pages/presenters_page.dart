import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iccc_app/models/presenter.dart';
import 'package:iccc_app/pages/profile_page.dart';
import 'package:iccc_app/providers.dart';
import 'package:iccc_app/widgets/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class PresentersPage extends ConsumerWidget {
  const PresentersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    //final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Presenters",
                  style: GoogleFonts.raleway(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              Text("Tap a name to view profile",
                  style: GoogleFonts.raleway(
                      fontSize: 14, fontWeight: FontWeight.bold))
            ],
          ),
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
                          child: ListTile(
                            title: Text(
                                presentersList[index]["firstName"] +
                                    " " +
                                    presentersList[index]["lastName"] +
                                    ", " +
                                    presentersList[index]["degree"] +
                                    " - " +
                                    presentersList[index]["employer"],
                                style: GoogleFonts.raleway(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(
                                      name: presentersList[index]["firstName"] +
                                          " " +
                                          presentersList[index]["lastName"],
                                      university: presentersList[index]
                                          ["employer"],
                                      position: presentersList[index]
                                          ["position"],
                                      email: presentersList[index]["email"],
                                      title: presentersList[index]["degree"]),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  });
            }),
        bottomNavigationBar: const BottomNavBarFb5(pageIndex: 2),
      ),
    );
  }
}
