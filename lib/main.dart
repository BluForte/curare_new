import 'package:curare/data/admin_pages/admin_home.dart';
import 'package:curare/data/models/userprofile_provider.dart';
import 'package:curare/firebase_options.dart';
import 'package:curare/pages/profile_2.dart';
import 'package:curare/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:curare/screens/signin_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:curare/data/models/hos_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAbu5HppezGGgja6hlq-ziO6zK9-GzDmTw",
            projectId: "curare-953db",
            storageBucket: "curare-953db.appspot.com",
            messagingSenderId: "557148011789",
            appId: "1:557148011789:android:bd8ddb165134fe1b568444"));
  } else {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HosModelDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserpageDetailsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const SignInScreen(),
      ),
    );
  }
}
