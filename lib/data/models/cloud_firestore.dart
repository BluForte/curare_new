import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curare/data/models/userp_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:curare/data/models/hospital_provider.dart';
import 'package:flutter/gestures.dart';

class CloudFire {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<HospitalModel> getDescAndName({required String hospitalId}) async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('Hospitals')
        .doc(hospitalId)
        .get();

    HospitalModel hospitalModel = HospitalModel.getModelFromJson(
      (snap.data() as dynamic),
    );
    return hospitalModel;
  }

  Future<UserModels> getUser() async {
    DocumentSnapshot snap = await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .get();
    UserModels usermodel =
        UserModels.getModelFromJson((snap.data() as dynamic));
    return usermodel;
  }
}
