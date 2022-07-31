class Hospital {
  String id;
  final String hname;
  final String dept;
  final String doc;
  final String timeSlot;

  Hospital({
    this.id = '',
    this.hname = '',
    this.dept = '',
    this.doc = '',
    this.timeSlot = '',
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "Hospital": hname,
        "Department": dept,
        "Doctor": doc,
        "TimeSlot": timeSlot,
      };
  static Hospital fromJson(Map<String, dynamic> json) => Hospital(
        id: json['id'],
        hname: json['Hospital'],
        dept: json['Department'],
        doc: json['Doctor'],
        timeSlot: json['TimeSlot'],
      );
}
