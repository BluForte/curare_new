import 'package:curare/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:curare/reusable_widgets/reusable_widget.dart';
//import 'package:curare/screens/home_screen.dart';
import 'package:curare/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:curare/data/remote_data_source/firestore_helper.dart';
import 'package:curare/data/models/user_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  
  TextEditingController _pname=TextEditingController();
  TextEditingController _pno=TextEditingController();
  TextEditingController _page=TextEditingController();
  TextEditingController _psex=TextEditingController();
  @override
  void dispose() {
    _pname.dispose();
    _pno.dispose();
    _page.dispose();
    _psex.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                Image.asset("lib/assets/logo1.png",scale: 3),
              

                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Patient Name", Icons.person_outline, false,
                    _pname),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.email, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Phone Number", Icons.call,false,
                    _pno),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 130,
                      child: reusableTextField("Age", Icons.people, false,
                          _page),
                    ),
                    SizedBox(
                      width: 130,
                      child: reusableTextField("sex", Icons.wc, false,
                          _psex),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: firebaseUIButton(context, "Sign Up", () async {
                    await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      print("Created New Account");
                      Navigator.push(context,
                      
                          MaterialPageRoute(builder: (context) => SignInScreen()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                    await FirestoreHelper.create(UserModel(pname: _pname.text, pno: _pno.text, page: _page.text, psex: _psex.text));
                
                  }),
                )
              ],
            ),
          ))),
    );
  }
  
  container({required Container child}) {}
}
