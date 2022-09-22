class Presenter {
  String firstName;
  String lastName;
  String degree;
  String employer;
  String position;
  String email;
  Map presentations;

  Presenter({
    required this.firstName,
    required this.lastName,
    required this.degree,
    required this.employer,
    required this.position,
    required this.email,
    required this.presentations,
  });

  Presenter.fromMap(Map<String, dynamic> map)
      : firstName = map["firstName"] ?? "",
        lastName = map["lastName"] ?? "",
        degree = map["degree"] ?? "",
        employer = map["employer"] ?? "",
        position = map["position"] ?? "",
        email = map["email"] ?? "",
        presentations = map["presentations"];

  Map<String, dynamic> toMap() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "degree": degree,
      "employer": employer,
      "position": position,
      "email": email,
      "presentations": presentations,
    };
  }
}
