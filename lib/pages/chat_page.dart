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
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
