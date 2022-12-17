import 'package:flutter/material.dart';
import 'package:github_client/widget/tema_widget.dart';

class Hastalik extends StatefulWidget {
  const Hastalik({super.key});

  @override
  State<Hastalik> createState() => _HastalikState();
}

class _HastalikState extends State<Hastalik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.3, 1.5],
              colors: [Colors.blue, Colors.white],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 70, bottom: 10),
            child: Column(
              children: <Widget>[
                const Tema(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 80, right: 15, bottom: 15),
                      child: Container(
                        width: 145,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.medication,
                            size: 40,
                          ),
                          label: const Text(
                            "Tedaviler",
                            style: TextStyle(fontSize: 15.0),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue.shade900),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/hastalikBilgileri')
                                .then((_) => setState(() {}));
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 80, left: 15, bottom: 15),
                      child: Container(
                        width: 145,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.medical_information_outlined,
                            size: 40,
                          ),
                          label: const Text(
                            "Tedavi Ekle",
                            style: TextStyle(fontSize: 15.0),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue.shade900),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/hastalikEkle')
                                .then((_) => setState(() {}));
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
