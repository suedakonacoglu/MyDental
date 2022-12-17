import 'package:flutter/material.dart';
import 'package:github_client/data/db/app_db.dart';

class HastalikListe extends StatefulWidget {
  const HastalikListe({super.key});

  @override
  State<HastalikListe> createState() => _HastalikListeState();
}

class _HastalikListeState extends State<HastalikListe> {
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
      body: FutureBuilder<List<HastalikData>>(
        future: _db.getHastaliklar(),
        builder: (context, snapshot) {
          final List<HastalikData>? hastaliklar = snapshot.data;
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
          if (hastaliklar != null) {
            return ListView.builder(
              itemCount: hastaliklar.length,
              itemBuilder: (context, index) {
                final hastalik = hastaliklar[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/hastalikDuzenle',
                            arguments: hastalik.proses)
                        .then((_) => setState(() {}));
                  },
                  child: SizedBox(
                    height: 217,
                    width: 500,
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
                                  "Tedavi:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(
                                  hastalik.proses.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Tedavi Ücreti:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(
                                  hastalik.money.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Hastalık Adı:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(
                                  hastalik.hastalikAdi.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Diş Adı:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(
                                  hastalik.dis.toString(),
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
