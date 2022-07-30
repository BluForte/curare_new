class Hospital {
  String id;
  final String hname;
  final String dept;
  final String doc;
  final String timeSlot;

  Hospital({
    this.id = '',
    required this.hname,
    required this.dept,
    required this.doc,
    required this.timeSlot,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "Hospital": hname,
        "Department": dept,
        "Doctor": doc,
        "TimeSlot": timeSlot,
      };
}
