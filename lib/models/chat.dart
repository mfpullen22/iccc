class Chat {
  final String myUid;
  final String myName;
  final String otherUid;
  final String otherName;
  final String chatId;

  Chat(
      {required this.chatId,
      required this.myUid,
      required this.otherUid,
      required this.myName,
      required this.otherName});

  // from JSON
  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      chatId: json['chatId'],
      myUid: json['myUid'],
      myName: json['myName'],
      otherUid: json['otherUid'],
      otherName: json['otherName'],
    );
  }
  // to JSON
  Map<String, dynamic> toJson() => {
        'chatId': chatId,
        'myUid': myUid,
        'otherUid': otherUid,
        'myName': myName,
        'otherName': otherName,
      };
}
