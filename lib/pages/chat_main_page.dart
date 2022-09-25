import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iccc_app/pages/list_chat_screen.dart';
import 'package:iccc_app/pages/select_person_to_chat.dart';
import 'package:iccc_app/widgets/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatMainPage extends ConsumerStatefulWidget {
  const ChatMainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatMainPageState();
}

class _ChatMainPageState extends ConsumerState<ChatMainPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Conference Chat",
                  style: GoogleFonts.raleway(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              Text("Tap a name to continue your chat",
                  style: GoogleFonts.raleway(
                      fontSize: 14, fontWeight: FontWeight.bold))
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: const ListChatScreen(), // Todo, change to list of chats
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(122, 0, 25, 1),
          child: const Icon(
            Icons.message,
            color: Colors.white,
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      const SelectPersonToChat()) // change to actual select person page)),
              ),
        ),
        bottomNavigationBar: const BottomNavBarFb5(pageIndex: 4),
      ),
    );
  }
}
