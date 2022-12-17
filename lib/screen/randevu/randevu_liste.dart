import 'package:flutter/material.dart';
import 'package:github_client/data/db/app_db.dart';

class RandevuListe extends StatefulWidget {
  const RandevuListe({super.key});

  @override
  State<RandevuListe> createState() => _RandevuListeState();
}

class _RandevuListeState extends State<RandevuListe> {
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
      body: FutureBuilder<List<RandevuData>>(
        future: _db.getRandevular(),
        builder: (context, snapshot) {
          final List<RandevuData>? randevular = snapshot.data;
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
          if (randevular != null) {
            return ListView.builder(
              itemCount: randevular.length,
              itemBuilder: (context, index) {
                final randevu = randevular[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/randevuDuzenle',
                            arguments: randevu.id)
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
                                  randevu.hasta.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Doktor Adı:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(
                                  randevu.doctor,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Randevu Tarihi:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(
                                  randevu.randevuTarihi.toIso8601String(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Randevu Saati:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(
                                  randevu.randevuSaati.toIso8601String(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              )
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
          return const Text("Veri bulunmadı");
        },
      ),
    );
  }
}
