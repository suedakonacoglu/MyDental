import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:github_client/data/db/app_db.dart';
import 'package:github_client/widget/tema_widget.dart';

class DoktorEkle extends StatefulWidget {
  const DoktorEkle({super.key});

  @override
  State<DoktorEkle> createState() => _DoktorEkleState();
}

class _DoktorEkleState extends State<DoktorEkle> {
  final _formKey = GlobalKey<FormState>();
  late MyDatabase _db;
  final TextEditingController _tcknController = TextEditingController();
  final TextEditingController _isimController = TextEditingController();
  final TextEditingController _telnoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _db = MyDatabase();
  }

  @override
  void dispose() {
    _db.close();
    _tcknController.dispose();
    _isimController.dispose();
    _telnoController.dispose();
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
                        height: 280,
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
                                    controller: _tcknController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: "TC Kimlik numarasını giriniz",
                                      labelText: "TC Kimlik Numarası",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'TC Kimlik numarası boş bırakılamaz';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: TextFormField(
                                    controller: _isimController,
                                    keyboardType: TextInputType.name,
                                    decoration: const InputDecoration(
                                      hintText: "İsim soyisim giriniz",
                                      labelText: "İsim Soyisim",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'İsim alanı boş bırakılamaz';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: TextFormField(
                                    controller: _telnoController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: "Telefon numarasını giriniz",
                                      labelText: "Telefon Numarası",
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Telefon numarası boş bırakılamaz';
                                      }
                                      return null;
                                    },
                                  ),
                                )
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
                            doktorEkle();
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

  void doktorEkle() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      final doktor = DoktorCompanion(
        doktorTC: drift.Value(_tcknController.text),
        isimSoyisim: drift.Value(_isimController.text),
        telNo: drift.Value(_telnoController.text),
      );
      _db.insertDoktor(doktor).then(
            (value) => ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                backgroundColor: Colors.blueAccent,
                content: const Text(
                  "Doktor bilgileri kaydedildi",
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
