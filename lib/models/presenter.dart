/* class Presenter {
  String firstName;
  String lastName;
  String degree;
  String employer;
  String position;
  String email;
  //List<Map<String, String>> presentations;
  //Map presentations;

  Presenter({
    required this.firstName,
    required this.lastName,
    required this.degree,
    required this.employer,
    required this.position,
    required this.email,
    //required this.presentations,
  });

  Presenter.fromMap(Map<String, dynamic> map)
      : firstName = map['firstName'] ?? "",
        lastName = map['lastName'] ?? "",
        degree = map['degree'] ?? "",
        employer = map['employer'] ?? "",
        position = map['position'] ?? "",
        email = map['email'] ?? "";
  //presentations = map['presentations'] ?? "";

  Map<String, dynamic> toMap() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "degree": degree,
      "employer": employer,
      "position": position,
      "email": email,
      //"presentations": presentations,
    };
  }
/* 
  factory Presenter.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Presenter(
        firstName: data["firstName"],
        lastName: data["lastName"],
        degree: data["degree"],
        employer: data["employer"],
        position: data["position"],
        email: data["email"]);
    //presentations: data["presentations"]);
  }

  factory Presenter.fromJson(Map<String, dynamic> json) {
    return Presenter(
      firstName: json['firstName'],
      lastName: json['lastName'],
      degree: json['degree'],
      employer: json['employer'],
      position: json['position'],
      email: json["email"],
      //presentations: json["presentations"],
    );
  }
  // to JSON
  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'degree': degree,
        'employer': employer,
        'position': position,
        "email": email,
        //"presentations": presentations,
      };*/
}
 */