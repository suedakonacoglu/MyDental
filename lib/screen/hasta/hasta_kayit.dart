import 'package:flutter/material.dart';
import 'package:github_client/data/db/app_db.dart';
import 'package:drift/drift.dart' as drift;
import 'package:github_client/widget/datepicker_textformfield.dart';
import 'package:github_client/widget/tema_widget.dart';
import 'package:intl/intl.dart';

class HastaKayit extends StatefulWidget {
  const HastaKayit({super.key});

  @override
  State<HastaKayit> createState() => _HastaKayitState();
}

class _HastaKayitState extends State<HastaKayit> {
  final _formKey = GlobalKey<FormState>();
  late MyDatabase _db;
  final TextEditingController _tcknController = TextEditingController();
  final TextEditingController _isimController = TextEditingController();
  final TextEditingController _soyisimController = TextEditingController();
  final TextEditingController _dogumTarihiController = TextEditingController();
  final TextEditingController _telnoController = TextEditingController();
  DateTime? _dogumTarihi;

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
    _soyisimController.dispose();
    _dogumTarihiController.dispose();
    _telnoController.dispose();
    super.dispose();
  }

  String dropDownValue = 'Seçiniz';
  var items = ['Seçiniz', 'Kadın', 'Erkek'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Center(
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
                          height: 450,
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
                                        hintText:
                                            "TC Kimlik numarasını giriniz",
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
                                        hintText: "İsim giriniz",
                                        labelText: "İsim",
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
                                    padding: const EdgeInsets.only(
                                        bottom: 10, top: 10),
                                    child: TextFormField(
                                      controller: _soyisimController,
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                        hintText: "Soyisim giriniz",
                                        labelText: "Soyisim",
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Soyisim alanı boş bırakılamaz';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            right: 10, top: 10, bottom: 10),
                                        child: Text(
                                          "Cinsiyet seçiniz:",
                                          style: TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10, bottom: 10),
                                        child: DropdownButton(
                                          value: dropDownValue,
                                          items: items.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropDownValue = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  DatePickerTextFormField(
                                    controller: _dogumTarihiController,
                                    callback: () {
                                      pickDateofBirth(context);
                                    },
                                    txtLabel: "Doğum Tarihi",
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
                      ),
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
                              hastaEkle();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.blue.shade900),
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
      ),
    );
  }

  void hastaEkle() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      final hasta = HastaCompanion(
        tckn: drift.Value(_tcknController.text),
        firstName: drift.Value(_isimController.text),
        lastNmae: drift.Value(_soyisimController.text),
        gender: drift.Value(dropDownValue.toString()),
        dateOfBirth: drift.Value(_dogumTarihi!),
        telno: drift.Value(_telnoController.text),
      );
      _db.insertHasta(hasta).then(
            (value) => ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                backgroundColor: Colors.blueAccent,
                content: const Text(
                  "Hasta bilgileri kaydedildi",
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

  Future<void> pickDateofBirth(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: _dogumTarihi ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 100),
      builder: (context, child) => Theme(
        data: ThemeData().copyWith(
          colorScheme: const ColorScheme.light(
            primary: Colors.blueAccent,
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
          dialogBackgroundColor: Colors.white,
        ),
        child: child ?? const Text(''),
      ),
    );
    if (newDate == null) {
      return;
    }

    setState(() {
      _dogumTarihi = newDate;
      String dob = DateFormat('dd/MM/yyyy').format(newDate);
      _dogumTarihiController.text = dob;
    });
  }
}
