
import 'package:curare/data/models/hos_provider.dart';
import 'package:curare/data/models/hospital_provider.dart';

import 'package:curare/data/admin_pages/admin_home.dart';
import 'package:curare/pages/auth_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:curare/reusable_widgets/reusable_widget.dart';
//import 'package:curare/screens/home_screen.dart';
import 'package:curare/screens/reset_password.dart';
import 'package:curare/screens/signup_screen.dart';
import 'package:curare/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:curare/pages/uhome.dart';
import 'package:provider/provider.dart';

import '../data/remote_data_source/firestore_helper.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  String? username;

  @override
  _getUserFromFirestore() async {
    final user = await FirestoreHelper.readUser();
    setState(() {
      username = user.pname;
    });
  }

  Widget build(BuildContext context) {
    Provider.of<HosModelDetailsProvider>(context)
        .getData(hospitalId: "FD31aWZF21JEV9doQCtE");

    //   Provider.of<HosModelDetailsProvider>(context)
    //  .getData(hospitalId: "KiJvPuUq1vvmChUDxA43");

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("414141"),
          hexStringToColor("010101"),
          hexStringToColor("010101")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                Image.asset("lib/assets/logo1.png", scale: 3),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Email ", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                SizedBox(
                  width: 200,
                  child: firebaseUIButton(context, "Sign In", () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthPages(),
                        ),
                      );
                    }).onError(
                      (error, stackTrace) {
                        // Add a dialog box
                        print("Error ${error.toString()}");
                      },
                    );
                  }),
                ),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
