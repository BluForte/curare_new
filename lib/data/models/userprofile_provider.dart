import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curare/data/models/user_model.dart';
import 'package:curare/data/models/userp_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'cloud_firestore.dart';

class UserpageDetailsProvider with ChangeNotifier {
  UserModels userpage;

  UserpageDetailsProvider()
      : userpage = UserModels(
            name: "loading...",
            pid: "loading...",
            no: "loading...",
            age: "loading...",
            sex: "loading...",
            mail: "loading...");
  Future<void> getDataUser() async {
    userpage = await CloudFire().getUser();
    notifyListeners();
  }
}
