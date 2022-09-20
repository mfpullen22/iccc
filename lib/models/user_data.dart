class UserData {
  String uid;
  String name;

  UserData({
    required this.name,
    required this.uid,
  });

  UserData.fromMap(Map<String, dynamic> map)
      : name = map['name'] ?? "",
        uid = map['uid'] ?? "";

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
    };
  }
}
