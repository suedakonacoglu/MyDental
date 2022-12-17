import 'package:flutter/material.dart';
import 'package:github_client/data/db/app_db.dart';

class DoktorBilgileri extends StatefulWidget {
  const DoktorBilgileri({super.key});

  @override
  State<DoktorBilgileri> createState() => _DoktorBilgileriState();
}

class _DoktorBilgileriState extends State<DoktorBilgileri> {
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
      body: FutureBuilder<List<DoktorData>>(
        future: _db.getDoktors(),
        builder: (context, snapshot) {
          final List<DoktorData>? doktorlar = snapshot.data;
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
          if (doktorlar != null) {
            return ListView.builder(
              itemCount: doktorlar.length,
              itemBuilder: (context, index) {
                final doktor = doktorlar[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/doktorDuzenle',
                            arguments: doktor.doktorTC)
                        .then((_) => setState(() {}));
                  },
                  child: SizedBox(
                    height: 175,
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
                                  doktor.doktorTC.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "İsim Soyisim:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(
                                  doktor.isimSoyisim.toString(),
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
                                  doktor.telNo.toString(),
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
