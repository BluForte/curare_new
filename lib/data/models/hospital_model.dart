class Hospital {
  String id;
  final String hname;
  final String dept;
  final String doc;
  final String timeSlot;

  Hospital({
    this.id = '',
<<<<<<< HEAD
    required this.hname,
    required this.dept,
    required this.doc,
    required this.timeSlot,
=======
    this.hname = '',
    this.dept = '',
    this.doc = '',
    this.timeSlot = '',
>>>>>>> 60d651db2d768e24561a905a324e0762d8074648
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "Hospital": hname,
        "Department": dept,
        "Doctor": doc,
        "TimeSlot": timeSlot,
      };
<<<<<<< HEAD
=======
  static Hospital fromJson(Map<String, dynamic> json) => Hospital(
        id: json['id'],
        hname: json['Hospital'],
        dept: json['Department'],
        doc: json['Doctor'],
        timeSlot: json['TimeSlot'],
      );
>>>>>>> 60d651db2d768e24561a905a324e0762d8074648
}
