import 'package:flutter/material.dart';
import 'package:github_client/data/db/app_db.dart';
import 'package:github_client/widget/name_textformfield.dart';
import 'package:github_client/widget/number_textformfield.dart';
import 'package:github_client/widget/tema_widget.dart';
import 'package:drift/drift.dart' as drift;

class DoktorDuzenle extends StatefulWidget {
  final String tckn;
  const DoktorDuzenle({required this.tckn, Key? key}) : super(key: key);

  @override
  State<DoktorDuzenle> createState() => DoktorDuzenleState();
}

class DoktorDuzenleState extends State<DoktorDuzenle> {
  final _formKey = GlobalKey<FormState>();
  late MyDatabase _db;
  late DoktorData _employeeData;
  final TextEditingController _tcknController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _telnoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _db = MyDatabase();
    getDoktor();
  }

  @override
  void dispose() {
    _db.close();
    _tcknController.dispose();
    _firstnameController.dispose();
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
            children: [
              const Tema(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      width: 400,
                      height: 305,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: NumberTextFormField(
                                controller: _tcknController,
                                txtLabel: "TC Kimlik Numarası",
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, top: 10),
                              child: NameTextFormField(
                                controller: _firstnameController,
                                txtLabel: "İsim Soyisim",
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, top: 10),
                              child: NumberTextFormField(
                                controller: _telnoController,
                                txtLabel: "Telefon Numarası",
                              ),
                            )
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
                          doktorDuzenle();
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
                        doktorSil();
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

  void doktorDuzenle() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      final doktor = DoktorCompanion(
        doktorTC: drift.Value(_tcknController.text),
        isimSoyisim: drift.Value(_firstnameController.text),
        telNo: drift.Value(_tcknController.text),
      );
      _db.updateDoktor(doktor).then(
            (value) => ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                backgroundColor: Colors.blueAccent,
                content: const Text(
                  'Doktor bilgileri kaydedildi',
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

  void doktorSil() {
    _db.deleteDoktor(widget.tckn).then(
          (value) => ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(
              backgroundColor: Colors.blueAccent,
              content: const Text(
                'Doktor silindi',
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

  Future<void> getDoktor() async {
    _employeeData = await _db.getDoktor(widget.tckn);
    _tcknController.text = _employeeData.doktorTC.toString();
    _firstnameController.text = _employeeData.isimSoyisim;
    _telnoController.text = _employeeData.telNo.toString();
  }
}
