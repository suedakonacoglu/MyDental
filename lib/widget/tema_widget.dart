import 'package:flutter/material.dart';

class Tema extends StatelessWidget {
  const Tema({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("logo.png"),
          radius: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "MyDental",
            style: TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 27.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.indigo.shade900,
            ),
          ),
        ),
      ],
    );
  }
}
