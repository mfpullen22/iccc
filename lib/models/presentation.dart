class Presentation {
  String firstName;
  String lastName;
  String day;
  String time;
  String title;
  String track;

  Presentation({
    required this.firstName,
    required this.lastName,
    required this.day,
    required this.time,
    required this.title,
    required this.track,
  });

  Presentation.fromMap(Map<String, dynamic> map)
      : firstName = map['firstName'] ?? "",
        lastName = map['lastName'] ?? "",
        day = map['day'] ?? "",
        time = map['time'] ?? "",
        title = map['title'] ?? "",
        track = map["track"] ?? "";

  Map<String, dynamic> toMap() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "day": day,
      "time": time,
      "title": title,
      "track": track,
    };
  }
}
