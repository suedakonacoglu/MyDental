import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:github_client/data/db/app_db.dart';
import 'package:github_client/widget/datepicker_textformfield.dart';
import 'package:github_client/widget/name_textformfield.dart';
import 'package:github_client/widget/number_textformfield.dart';
import 'package:github_client/widget/tema_widget.dart';
import 'package:intl/intl.dart';

class HastaBilgi extends StatefulWidget {
  final String tckn;
  const HastaBilgi({required this.tckn, Key? key}) : super(key: key);

  @override
  State<HastaBilgi> createState() => _HastaBilgiState();
}

class _HastaBilgiState extends State<HastaBilgi> {
  final _formKey = GlobalKey<FormState>();
  late MyDatabase _db;
  late HastaData _hastaData;
  final TextEditingController _tcknController = TextEditingController();
  final TextEditingController _isimController = TextEditingController();
  final TextEditingController _soyisimController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dogumTarihiController = TextEditingController();
  final TextEditingController _telnoController = TextEditingController();
  DateTime? _dogumTarihi;

  @override
  void initState() {
    _db = MyDatabase();
    super.initState();
    getHasta();
  }

  @override
  void dispose() {
    _db.close();
    _tcknController.dispose();
    _isimController.dispose();
    _soyisimController.dispose();
    _genderController.dispose();
    _dogumTarihiController.dispose();
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
                          height: 460,
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
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: NameTextFormField(
                                    controller: _isimController,
                                    txtLabel: "İsim",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: NameTextFormField(
                                    controller: _soyisimController,
                                    txtLabel: "Soyisim",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: NameTextFormField(
                                    controller: _tcknController,
                                    txtLabel: "Cinsiyet",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: DatePickerTextFormField(
                                    callback: () {
                                      pickDateofBirth(context);
                                    },
                                    controller: _dogumTarihiController,
                                    txtLabel: "Doğum Tarihi",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: NumberTextFormField(
                                    controller: _telnoController,
                                    txtLabel: "Telefon Numarası",
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
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
                              hastaGuncelle();
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
                      ),*/
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        child: IconButton(
                          onPressed: () {
                            hastaSil();
                          },
                          icon: const Icon(Icons.delete),
                          color: Colors.white,
                        ),
                      ),
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

  void hastaSil() {
    _db.deleteHasta(widget.tckn).then(
          (value) => ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(
              backgroundColor: Colors.blueAccent,
              content: const Text(
                'Hasta silindi',
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

  void hastaGuncelle() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      final hasta = HastaCompanion(
        tckn: drift.Value(widget.tckn),
        firstName: drift.Value(_isimController.text),
        lastNmae: drift.Value(_soyisimController.text),
        gender: drift.Value(_genderController.text),
        dateOfBirth: drift.Value(_dogumTarihi!),
        telno: drift.Value(_telnoController.text),
      );
      _db.updateHasta(hasta).then(
            (value) => ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                backgroundColor: Colors.blueAccent,
                content: const Text(
                  'Hasta bilgileri kaydedildi',
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

  Future<void> pickDateofBirth(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      locale: const Locale("tr", "TR"),
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

  Future<void> getHasta() async {
    _hastaData = await _db.getHasta(widget.tckn);
    _tcknController.text = _hastaData.tckn.toString();
    _isimController.text = _hastaData.firstName;
    _soyisimController.text = _hastaData.lastNmae;
    _genderController.text = _hastaData.gender;
    _dogumTarihiController.text = _hastaData.dateOfBirth.toIso8601String();
    _telnoController.text = _hastaData.telno.toString();
  }
}
