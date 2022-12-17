import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:github_client/widget/tema_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.blueAccent.shade700,
        overlayOpacity: 0.2,
        icon: Icons.add,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.dashboard_customize_rounded),
            label: 'Hastalık ekle',
            backgroundColor: Colors.lightBlueAccent.shade700,
            onTap: () {
              Navigator.pushNamed(context, '/hastalik')
                  .then((_) => setState(() {}));
            },
            foregroundColor: Colors.white,
          ),
          SpeedDialChild(
            child: const Icon(Icons.person),
            label: 'Doktor bilgileri',
            backgroundColor: Colors.lightBlueAccent.shade700,
            onTap: () {
              Navigator.pushNamed(context, '/doktor')
                  .then((_) => setState(() {}));
            },
            foregroundColor: Colors.white,
          ),
        ],
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
              children: [
                const Tema(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, right: 15, bottom: 15),
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.people_alt_outlined,
                            size: 40,
                          ),
                          label: const Text(
                            "Hasta Kayıt",
                            style: TextStyle(fontSize: 15.0),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue.shade900),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/hastaKayit')
                                .then((_) => setState(() {}));
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 15, bottom: 15),
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.article,
                            size: 40,
                          ),
                          label: const Text(
                            "Yeni Randevu",
                            style: TextStyle(fontSize: 15.0),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue.shade900),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/randevuKayit')
                                .then((_) => setState(() {}));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, right: 15, bottom: 15),
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.person_pin_outlined,
                            size: 40,
                          ),
                          label: const Text(
                            "Hasta Listesi",
                            style: TextStyle(fontSize: 15.0),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue.shade900),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/hastaListe')
                                .then((_) => setState(() {}));
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 15, bottom: 15),
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.format_list_bulleted,
                            size: 40,
                          ),
                          label: const Text(
                            "Randevu Listesi",
                            style: TextStyle(fontSize: 15.0),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue.shade900),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/randevuListe')
                                .then((_) => setState(() {}));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
