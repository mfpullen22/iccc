class Location {
  String day;
  String session;
  String location;


  Location(
      {required this.day,
      required this.session,
      required this.location});

  Location.fromMap(Map<String, dynamic> map)
      : day = map['day'] ?? "",
        session = map['session'] ?? "",
        location = map["location"] ?? "";

  Map<String, dynamic> toMap() {
    return {
      "day": day,
      "session": session,
      "location": location,};
  }
}
