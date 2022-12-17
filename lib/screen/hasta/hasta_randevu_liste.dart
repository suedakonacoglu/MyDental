import 'package:flutter/material.dart';
import 'package:github_client/data/db/app_db.dart';

class HastaRandevuListe extends StatefulWidget {
  final String tckn;
  const HastaRandevuListe({required this.tckn, Key? key}) : super(key: key);

  @override
  State<HastaRandevuListe> createState() => _HastaRandevuListeState();
}

class _HastaRandevuListeState extends State<HastaRandevuListe> {
  late MyDatabase _db;
  late HastaData _hastaData;
  final TextEditingController _isimController = TextEditingController();
  final TextEditingController _soyisimController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _db = MyDatabase();
    getHasta();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          '${_isimController.text} ${_soyisimController.text}',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/hastaBilgi',
                      arguments: widget.tckn)
                  .then((_) => setState(() {}));
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: FutureBuilder<List<RandevuData>>(
        future: _db.getHastaRandevular(widget.tckn),
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
                    height: 150,
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
                                  "Randevu Tarihi:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(
                                  randevu.randevuTarihi.toString(),
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
                                  randevu.randevuSaati.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              ListTile(
                                leading: const Text(
                                  "Tedavi Adı:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                title: Text(
                                  randevu.hastalik.toString(),
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

  Future<void> getHasta() async {
    _hastaData = await _db.getHasta(widget.tckn);
    _isimController.text = _hastaData.firstName;
    _soyisimController.text = _hastaData.lastNmae;
  }
}
