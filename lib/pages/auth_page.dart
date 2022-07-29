import 'package:curare/pages/uhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../data/admin_pages/admin_home.dart';
import '../data/remote_data_source/firestore_helper.dart';

class AuthPages extends StatefulWidget {
  const AuthPages({Key? key}) : super(key: key);

  @override
  State<AuthPages> createState() => _AuthPagesState();
}

class _AuthPagesState extends State<AuthPages> {
  String? username;

  @override
  void initState() {
    super.initState();
    _getUserFromFirestore();
  }

  _getUserFromFirestore() async {
    final user = await FirestoreHelper.readUser();
    setState(() {
      username = user.pname;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (username == 'admin') {
      return AdminHome();
    } else {
      return Mypage1();
    }
  }
}
