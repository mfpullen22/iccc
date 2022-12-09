import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iccc_app/pages/list_chat_screen.dart';
import 'package:iccc_app/pages/select_person_to_chat.dart';
import 'package:iccc_app/widgets/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    var user = FirebaseAuth.instance.currentUser;
    if (user?.displayName != null) {}
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

class CustomInputFieldFb1 extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final Color primaryColor;
  final String labelText;

  const CustomInputFieldFb1(
      {Key? key,
      required this.inputController,
      required this.hintText,
      required this.labelText,
      this.primaryColor = Colors.indigo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        controller: inputController,
/*         onChanged: (value) {
          //Do something wi
        }, */
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
          fillColor: Colors.transparent,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          border: UnderlineInputBorder(
            borderSide:
                BorderSide(color: primaryColor.withOpacity(.1), width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2.0),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: primaryColor.withOpacity(.1), width: 2.0),
          ),
        ),
      ),
    );
  }
}

/*                           Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SetProfilePage()),
                          ); */