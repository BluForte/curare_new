class HospitalModel {
  final String desc;
  final String name;

  HospitalModel({required this.desc, required this.name});

  Map<String, dynamic> getJson() => {"name:": name, "desc": desc};

  factory HospitalModel.getModelFromJson(Map<String, dynamic> json) {
    return HospitalModel(desc: json["desc"], name: json["name"]);
  }
}
