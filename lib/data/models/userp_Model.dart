class UserModels {
  final String name;
  final String age;
  final String pid;
  final String sex;
  final String no;
  final String mail;

  UserModels(
      {required this.age,
      required this.name,
      required this.no,
      required this.pid,
      required this.sex,
      required this.mail});
  Map<String, dynamic> getJson() => {
        "Patient Name:": name,
        "Patient Age": age,
        "Sex": sex,
        "Patient Id": pid,
        "Phone Number": no,
        "Email": mail,
      };
  factory UserModels.getModelFromJson(Map<String, dynamic> json) {
    return UserModels(
        name: json["Patient Name"],
        age: json["Patient Age"],
        sex: json["Sex"],
        pid: json["Patient Id"],
        no: json["Phone Number"],
        mail: json["Email"]);
  }
}
