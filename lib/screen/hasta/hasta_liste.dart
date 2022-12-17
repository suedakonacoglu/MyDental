import 'package:flutter/material.dart';
import 'package:github_client/data/db/app_db.dart';

class HastaListe extends StatefulWidget {
  const HastaListe({super.key});

  @override
  State<HastaListe> createState() => _HastaListeState();
}

class _HastaListeState extends State<HastaListe> {
  late MyDatabase _db;

  @override
  void initState() {
    super.initState();
    _db = MyDatabase();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: FutureBuilder<List<HastaData>>(
        future: _db.getHastalar(),
        builder: (context, snapshot) {
          final List<HastaData>? hastalar = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (hastalar != null) {
            return ListView.builder(
              itemCount: hastalar.length,
              itemBuilder: (context, index) {
                final hasta = hastalar[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/hastaRandevuListe',
                            arguments: hasta.tckn)
                        .then((_) => setState(() {}));
                  },
                  child: SizedBox(
                    height: 218,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Card(
                        color: Colors.white,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.indigo,
                            width: 1.2,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ListTile(
                                leading: const Text(
                                  "TC Kimlik Numarası:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(
                                  hasta.tckn.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "İsim:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(
                                  hasta.firstName.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Soyisim:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(
                                  hasta.lastNmae.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Telefon Numarası:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(
                                  hasta.telno.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Text("Veri bulunamadı");
        },
      ),
    );
  }
}
