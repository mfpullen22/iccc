import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iccc_app/pages/list_chat_screen.dart';
import 'package:iccc_app/pages/select_person_to_chat.dart';
import 'package:iccc_app/widgets/bottom_navbar.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Conference Chat"),
            Text("Tap a name to continue your chat",
                style: TextStyle(fontSize: 14))
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
    );
  }
}
