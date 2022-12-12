import 'dart:ffi';

class Presentation {
  String firstName;
  String lastName;
  String degree;
  String employer;
  String position;
  String email;
  String day;
  Int time;
  String title;
  String track;
  String oral;
  String abstract;

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
      required this.abstract});

  Presentation.fromMap(Map<String, dynamic> map)
      : firstName = map['firstName'] ?? "",
        lastName = map['lastName'] ?? "",
        degree = map["degree"] ?? "",
        employer = map["employer"] ?? "",
        position = map["position"] ?? "",
        email = map["email"] ?? "",
        day = map['day'] ?? "",
        time = map['time'] ?? "",
        title = map['title'] ?? "",
        track = map["track"] ?? "",
        oral = map["oral"] ?? "",
        abstract = map["abstract"] ?? "";

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
      "abstract": abstract,
    };
  }
}
