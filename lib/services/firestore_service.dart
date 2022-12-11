import 'package:cloud_firestore/cloud_firestore.dart';
import "package:iccc_app/models/message.dart";
import 'package:iccc_app/models/presentation.dart';
import '../models/chat.dart';
import '../models/user_data.dart';
import "../models/presenter.dart";

class FirestoreService {
  FirestoreService({required this.uid});
  final String uid;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<Presenter>> getPresenters() {
    return firestore
        .collection("presenters")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final d = doc.data();
              final u = Presenter.fromMap(d);
              return u;
            }).toList());
  }

  Stream<List<Presentation>> getPresentations(day) {
    return firestore
        .collection("presentations")
        .where("day", isEqualTo: day)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final d = doc.data();
              final u = Presentation.fromMap(d);
              return u;
            }).toList());
  }

  // Save the user in a user collection
  Future<void> addUser(
    UserData user,
  ) async {
    await firestore.collection("users").doc(user.uid).set(user.toMap());
  }

  Future<UserData?> getUser(String uid) async {
    final doc = await firestore.collection("users").doc(uid).get();
    return doc.exists ? UserData.fromMap(doc.data()!) : null;
  }

  // get all users
  Stream<List<UserData>> getUsers() {
    return firestore
        .collection("users")
        .orderBy("name")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final d = doc.data();
              final u = UserData.fromMap(d);
              return u;
            }).toList());
  }

  // start a chat with 2 users
  Future<String> startChat(
      String uid1, String otherUid, String otherName) async {
    final myUser = await getUser(uid1);
    final docId = firestore.collection("chats").doc().id;
    await firestore.collection("chats").doc(docId).set(Chat(
            chatId: docId,
            myUid: uid1,
            otherUid: otherUid,
            myName: myUser?.name ?? "",
            otherName: otherName)
        .toJson());
    return docId;
  }

  // query the chat collection to get all the chats of that the user with uid is part of
  Stream<List<Chat?>> getChats() {
    return firestore
        .collection("chats")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final d = doc.data();
              final c = Chat.fromJson(d);
              if (c.myUid == uid || c.otherUid == uid) {
                return c;
              }
              return null;
            }).toList());
  }

  // send a chat message
  Future<void> sendMessage(String chatId, Message message) async {
    await firestore
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .add(message.toJson());
  }

  // read the msgs of a chat
  Stream<List<Message>> getMessages(String chatId) {
    final a = firestore
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .orderBy('time', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final d = doc.data();
              final u = Message.fromJson(d);
              return u;
            }).toList());
    return a;
  }

  // check if there is already a chat started
  Future<String> getChatStarted(String uid1, String uid2) async {
    final doc1 = await firestore
        .collection("chats")
        .where('myUid', isEqualTo: uid1)
        .where('otherUid', isEqualTo: uid2)
        .get();
    if (doc1.docs.isNotEmpty) {
      return doc1.docs[0].id;
    }
    final doc2 = await firestore
        .collection("chats")
        .where('otherUid', isEqualTo: uid1)
        .where('myUid', isEqualTo: uid2)
        .get();
    if (doc2.docs.isNotEmpty) {
      return doc2.docs[0].id;
    }
    return "";
  }
}
