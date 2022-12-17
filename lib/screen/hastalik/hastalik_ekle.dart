import 'package:flutter/material.dart';
import 'package:github_client/data/db/app_db.dart';
import 'package:drift/drift.dart' as drift;
import 'package:github_client/widget/tema_widget.dart';

class HastalikEkle extends StatefulWidget {
  const HastalikEkle({super.key});

  @override
  State<HastalikEkle> createState() => _HastalikEkleState();
}

class _HastalikEkleState extends State<HastalikEkle> {
  final _formKey = GlobalKey<FormState>();
  late MyDatabase _db;
  final TextEditingController _tedaviController = TextEditingController();
  final TextEditingController _hastalikController = TextEditingController();
  final TextEditingController _ucretController = TextEditingController();
  final TextEditingController _disController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _db = MyDatabase();
  }

  @override
  void dispose() {
    _db.close();
    _tedaviController.dispose();
    _hastalikController.dispose();
    _ucretController.dispose();
    _disController.dispose();
    super.dispose();
  }

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
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: TextFormField(
                                    controller: _tedaviController,
                                    keyboardType: TextInputType.name,
                                    decoration: const InputDecoration(
                                      hintText: "Tedavi adını giriniz",
                                      labelText: "Tedavi Adı",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Tedavi adı boş bırakılamaz';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: TextFormField(
                                    controller: _hastalikController,
                                    keyboardType: TextInputType.name,
                                    decoration: const InputDecoration(
                                      hintText: "Hastalık adını giriniz",
                                      labelText: "Hastalık Adı",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Hastalık boş bırakılamaz';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: TextFormField(
                                    controller: _disController,
                                    keyboardType: TextInputType.name,
                                    decoration: const InputDecoration(
                                      hintText: "Diş adını giriniz",
                                      labelText: "Diş Adı",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Diş adı boş bırakılamaz';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: TextFormField(
                                    controller: _ucretController,
                                    keyboardType: TextInputType.name,
                                    decoration: const InputDecoration(
                                      hintText: "Tedavi ücretini giriniz",
                                      labelText: "Ücret",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Ücret alanı boş bırakılamaz';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        width: 140,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            hastalikEkle();
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
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void hastalikEkle() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      final hastalik = HastalikCompanion(
        proses: drift.Value(_tedaviController.text),
        hastalikAdi: drift.Value(_hastalikController.text),
        money: drift.Value(_ucretController.text),
        dis: drift.Value(_disController.text),
      );
      _db.insertHastalik(hastalik).then(
            (value) => ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                backgroundColor: Colors.blueAccent,
                content: const Text(
                  "Tedavi bilgileri kaydedildi",
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  TextButton(
                    onPressed: () => ScaffoldMessenger.of(context)
                        .hideCurrentMaterialBanner(),
                    child: const Text(
                      "Tamam",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
    }
  }
}
