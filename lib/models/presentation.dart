//import 'dart:ffi';

class Presentation {
  String firstName;
  String lastName;
  String degree;
  String employer;
  String position;
  String email;
  String day;
  int time;
  String title;
  int track;
  String oral;
  String abs;
  String skip;

  Presentation(
      {required this.firstName,
      required this.lastName,
      required this.degree,
      required this.employer,
      required this.position,
      required this.email,
      required this.day,
      required this.time,
      required this.title,
      required this.track,
      required this.oral,
      required this.abs,
      required this.skip});

  Presentation.fromMap(Map<String, dynamic> map)
      : firstName = map['firstName'] ?? "",
        lastName = map['lastName'] ?? "",
        degree = map["degree"] ?? "",
        employer = map["employer"] ?? "",
        position = map["position"] ?? "",
        email = map["email"] ?? "",
        day = map['day'] ?? "",
        time = map['time'] ?? 0,
        title = map['title'] ?? "",
        track = map["track"] ?? 0,
        oral = map["oral"] ?? "",
        abs = map["abs"] ?? "",
        skip = map["skip"] ?? "";

  Map<String, dynamic> toMap() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "day": day,
      "time": time,
      "title": title,
      "track": track,
      "degree": degree,
      "employer": employer,
      "position": position,
      "email": email,
      "oral": oral,
      "abs": abs,
      "skip": skip,
    };
  }
}
