import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curare/data/models/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:curare/data/models/hospital_provider.dart';

class HosModelDetailsProvider with ChangeNotifier {
  HospitalModel hospitalDetails;

  HosModelDetailsProvider()
      : hospitalDetails = HospitalModel(desc: "loading...", name: "loading...");
  Future<void> getData({required String hospitalId}) async {
    hospitalDetails = await CloudFire().getDescAndName(hospitalId: hospitalId);
    notifyListeners();
  }
}
// class HosModelDetailsProvider with ChangeNotifier {
//   HospitalModel hospitalDetails;

//   HosModelDetailsProvider()
//       : hospitalDetails = HospitalModel(desc: "loading...", name: "loading...");
//   Future<void> getData({required String hospitalId}) async {
//     hospitalDetails = await CloudFire().getDescAndName(hospitalId: hospitalId);
//     notifyListeners();
//   }
// }
