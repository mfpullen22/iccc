import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:iccc_app/models/chat.dart";
import "package:iccc_app/models/message.dart";
import "package:iccc_app/providers.dart";

class ChatPage extends ConsumerStatefulWidget {
  final Chat chat;
  const ChatPage({required this.chat, Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage>
    with SingleTickerProviderStateMixin {
  final _textMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final myUid = ref.read(firebaseAuthProvider).currentUser!.uid;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.chat.myUid == myUid
              ? widget.chat.otherName
              : widget.chat.myName),
          actions: const <Widget>[
            Icon(Icons.video_call),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
            ),
            Icon(Icons.call),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
            ),
            Icon(Icons.more_vert),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
            ),
          ],
        ),
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Image.network(
                  "https://i.pinimg.com/736x/8c/98/99/8c98994518b575bfd8c949e91d20548b.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Expanded(
                    child: StreamBuilder<List<Message>>(
                      stream: ref
                          .read(databaseProvider)!
                          .getMessages(widget.chat.chatId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.active &&
                            snapshot.hasData) {
                          final messages = snapshot.data ?? [];
                          return ListView.builder(
                            reverse: true,
                            itemCount: messages.length,
                            itemBuilder: (_, index) {
                              final message = messages[index];
                              final isMe = message.myUid ==
                                  ref
                                      .read(firebaseAuthProvider)
                                      .currentUser!
                                      .uid;
                              if (isMe) {
                                return Align(
                                  alignment: Alignment.centerRight,
                                  child: myChatBubble(message),
                                );
                              } else {
                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: otherChatBubble(message),
                                );
                              }
                            },
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  sendMessageField(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget sendMessageField() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30, left: 4, right: 4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(80)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        offset: const Offset(0.0, 0.50),
                        spreadRadius: 1,
                        blurRadius: 1),
                  ]),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.insert_emoticon,
                    color: Colors.grey[500],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 60,
                      ),
                      child: Scrollbar(
                        child: TextField(
                          maxLines: null,
                          style: const TextStyle(fontSize: 14),
                          controller: _textMessageController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type a message",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.link),
                      const SizedBox(
                        width: 10,
                      ),
                      _textMessageController.text.isEmpty
                          ? const Icon(Icons.camera_alt)
                          : const Text(""),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: () async {
              if (_textMessageController.text.isNotEmpty) {
                await ref.read(databaseProvider)!.sendMessage(
                      widget.chat.chatId,
                      Message(
                        text: _textMessageController.text,
                        myUid: ref.read(firebaseAuthProvider).currentUser!.uid,
                        time: DateTime.now().toString(),
                      ),
                    );
                _textMessageController.text = "";
              }
            },
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget myChatBubble(Message message) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin:
          const EdgeInsets.only(left: 50.0, right: 15.0, top: 7.0, bottom: 7.0),
      decoration: BoxDecoration(
        color: const Color(0xffE2FDC4),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.grey.withOpacity(.1),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Text(message.text),
    );
  }

  Widget otherChatBubble(Message message) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin:
          const EdgeInsets.only(left: 15.0, right: 50.0, top: 7.0, bottom: 7.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.grey.withOpacity(.1),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
        ),
      ),
      child: Text(message.text),
    );
  }
}
