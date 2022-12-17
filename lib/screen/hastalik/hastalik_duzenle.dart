import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:github_client/data/db/app_db.dart';
import 'package:github_client/widget/name_textformfield.dart';
import 'package:github_client/widget/number_textformfield.dart';
import 'package:github_client/widget/tema_widget.dart';

class HastalikDuzenle extends StatefulWidget {
  final String tedavi;
  const HastalikDuzenle({required this.tedavi, Key? key}) : super(key: key);

  @override
  State<HastalikDuzenle> createState() => _HastalikDuzenleState();
}

class _HastalikDuzenleState extends State<HastalikDuzenle> {
  final _formKey = GlobalKey<FormState>();
  late MyDatabase _db;
  late HastalikData _hastalikData;
  final TextEditingController _tedaviController = TextEditingController();
  final TextEditingController _hastalikController = TextEditingController();
  final TextEditingController _ucretController = TextEditingController();
  final TextEditingController _disController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _db = MyDatabase();
    getTedavi();
  }

  @override
  void dispose() {
    super.dispose();
    _db.close();
    _tedaviController.dispose();
    _hastalikController.dispose();
    _ucretController.dispose();
    _disController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.3, 1.5],
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
          child: Column(
            children: <Widget>[
              const Tema(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      width: 400,
                      height: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, top: 10),
                              child: NameTextFormField(
                                controller: _tedaviController,
                                txtLabel: "Tedavi Adı",
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, top: 10),
                              child: NameTextFormField(
                                controller: _hastalikController,
                                txtLabel: "Hastalık Adı",
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, top: 10),
                              child: NameTextFormField(
                                controller: _disController,
                                txtLabel: "Diş Adı",
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, top: 10),
                              child: NumberTextFormField(
                                controller: _ucretController,
                                txtLabel: "Tedavi Ücreti",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*Padding(
                    padding: const EdgeInsets.only(top: 20, right: 10),
                    child: Container(
                      width: 140,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          hastalikDuzenle();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue.shade900),
                        ),
                        child: const Text(
                          "Kaydet",
                          style: TextStyle(fontSize: 17.0),
                        ),
                      ),
                    ),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: IconButton(
                      onPressed: () {
                        hastalikSil();
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void hastalikSil() {
    _db.deleteHastalik(widget.tedavi).then(
          (value) => ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(
              backgroundColor: Colors.blueAccent,
              content: const Text(
                'Tedavi silindi',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                TextButton(
                  onPressed: () =>
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                  child: const Text(
                    'Tamam',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
  }

  void hastalikDuzenle() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      final hastalik = HastalikCompanion(
        proses: drift.Value(_tedaviController.text),
        hastalikAdi: drift.Value(_hastalikController.text),
        money: drift.Value(_ucretController.text),
        dis: drift.Value(_disController.text),
      );
      _db.updateHastalik(hastalik).then(
            (value) => ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                backgroundColor: Colors.blueAccent,
                content: const Text(
                  'Tedavi bilgileri kaydedildi',
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  TextButton(
                    onPressed: () => ScaffoldMessenger.of(context)
                        .hideCurrentMaterialBanner(),
                    child: const Text(
                      'Tamam',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
    }
  }

  Future<void> getTedavi() async {
    _hastalikData = await _db.getHastalik(widget.tedavi);
    _tedaviController.text = _hastalikData.proses;
    _hastalikController.text = _hastalikData.hastalikAdi;
    _ucretController.text = _hastalikData.money.toString();
    _disController.text = _hastalikData.dis;
  }
}
