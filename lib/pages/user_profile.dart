import 'package:flutter/material.dart';

class UP extends StatefulWidget {
  const UP({Key? key}) : super(key: key);

  @override
  State<UP> createState() => _UPState();
}

class _UPState extends State<UP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 106, 255, 243),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      children: const [
                        Text("Name"),
                        SizedBox(width: 15),
                        Text(""),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: const [
                        Text("Name"),
                        SizedBox(width: 15),
                        Text(""),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
