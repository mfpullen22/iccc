import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chat.dart';
import '../pages/chat_page.dart';
import '../providers.dart';
import 'package:google_fonts/google_fonts.dart';

class ListChatScreen extends ConsumerWidget {
  const ListChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return StreamBuilder<List<Chat?>>(
      stream: ref.read(databaseProvider)!.getChats(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong!"),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final chats = snapshot.data ?? [];
        return ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            final chat = chats[index]; // type Chat
            final myUser =
                ref.read(firebaseAuthProvider).currentUser!; // type User
            if (chat == null) {
              return Container();
            }
            return Column(
              children: [
                ListTile(
                  title: Text(
                      myUser.uid == chat.myUid ? chat.otherName : chat.myName),
                  onTap: () async {
                    // start a chat
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                          chat: chat,
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
