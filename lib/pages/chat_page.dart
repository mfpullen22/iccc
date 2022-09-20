import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iccc_app/pages/select_person_to_chat.dart';
import "package:iccc_app/providers.dart";
import 'package:iccc_app/widgets/bottom_navbar.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Conference Chat"),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavBarFb5(),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          const OtherTab(tabName: "Camera"),
          Container(), // Todo, change to list of chats
          const OtherTab(tabName: "Status"),
          const OtherTab(tabName: "Calls"),
        ],
      ),
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
                    SelectPersonToChat()) // change to actual select person page)),
            ),
      ),
    );
  }
}

// TODO: to implement
class OtherTab extends StatelessWidget {
  final String tabName;
  const OtherTab({required this.tabName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(tabName),
    );
  }
}

/* import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = FirebaseAuth.instance.currentUser!.displayName;
    return Scaffold(
      appBar: AppBar(title: const Text("Live Chat")),
      body: Center(
        child: Column(
          children: [
            Text("Live Chat Page"),
            Text(name!),
          ],
        ),
      ),
    );
  }
} */