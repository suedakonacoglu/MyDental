import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:github_client/data/db/app_db.dart';
import 'package:github_client/widget/datepicker_textformfield.dart';
import 'package:github_client/widget/name_textformfield.dart';
import 'package:github_client/widget/number_textformfield.dart';
import 'package:github_client/widget/tema_widget.dart';
import 'package:intl/intl.dart';

class RandevuDuzenle extends StatefulWidget {
  final int id;
  const RandevuDuzenle({required this.id, Key? key}) : super(key: key);

  @override
  State<RandevuDuzenle> createState() => _RandevuDuzenleState();
}

class _RandevuDuzenleState extends State<RandevuDuzenle> {
  final _formKey = GlobalKey<FormState>();
  late MyDatabase _db;
  late RandevuData _randevuData;
  final TextEditingController _hastaTcController = TextEditingController();
  final TextEditingController _doktorController = TextEditingController();
  final TextEditingController _tedaviController = TextEditingController();
  final TextEditingController _disController = TextEditingController();
  final TextEditingController _tarihController = TextEditingController();
  final TextEditingController _saatController = TextEditingController();
  final TextEditingController _ucretController = TextEditingController();
  DateTime? _tarih, _saat;
  final format = DateFormat('hh:mm');
  final now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _db = MyDatabase();
    getRandevu();
  }

  @override
  void dispose() {
    _db.close();
    _hastaTcController.dispose();
    _doktorController.dispose();
    _tedaviController.dispose();
    _disController.dispose();
    _tarihController.dispose();
    _saatController.dispose();
    _ucretController.dispose();
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
                                    controller: _hastaTcController,
                                    txtLabel: "TC Kimlik Numarası",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: NameTextFormField(
                                    controller: _doktorController,
                                    txtLabel: "Doktor Adı",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: NameTextFormField(
                                    controller: _tedaviController,
                                    txtLabel: "Tedavi Adı",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: NameTextFormField(
                                    controller: _disController,
                                    txtLabel: "Diş Adı",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: DatePickerTextFormField(
                                    callback: () {
                                      pickDate(context);
                                    },
                                    controller: _tarihController,
                                    txtLabel: "Randevu Tarihi",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: DateTimeField(
                                    format: format,
                                    onShowPicker:
                                        (context, currentValue) async {
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            currentValue ?? DateTime.now()),
                                      );
                                      setState(() {
                                        _saat = DateTime(now.day, now.month,
                                            now.year, time!.hour, time.minute);
                                      });
                                      return DateTimeField.convert(time);
                                    },
                                    controller: _saatController,
                                    decoration: const InputDecoration(
                                        label: Text("Randevu Saati")),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: NumberTextFormField(
                                    controller: _ucretController,
                                    txtLabel: "Ücret",
                                  ),
                                ),
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
                              randevuGuncelle();
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
                            randevuSil();
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

  void randevuSil() {
    _db.deleteRandevu(widget.id).then(
          (value) => ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(
              backgroundColor: Colors.blueAccent,
              content: const Text(
                'Randevu silindi',
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

  void randevuGuncelle() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      final randevu = RandevuCompanion(
        hasta: drift.Value(_hastaTcController.text),
        doctor: drift.Value(_doktorController.text),
        randevuTarihi: drift.Value(_tarih!),
        randevuSaati: drift.Value(_saat!),
        hastalik: drift.Value(_tedaviController.text),
        dis: drift.Value(_disController.text),
        ucret: drift.Value(_ucretController.text),
      );
      _db.updateRandevu(randevu).then(
            (value) => ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                backgroundColor: Colors.blueAccent,
                content: const Text(
                  'Randevu bilgileri kaydedildi',
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

  Future<void> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      locale: const Locale("tr", "TR"),
      initialDate: _tarih ?? initialDate,
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
      _tarih = newDate;
      String dob = DateFormat('dd/MM/yyyy').format(newDate);
      _tarihController.text = dob;
    });
  }

  Future<void> getRandevu() async {
    _randevuData = await _db.getRandevu(widget.id);
    _hastaTcController.text = _randevuData.hasta.toString();
    _doktorController.text = _randevuData.doctor;
    _tedaviController.text = _randevuData.hastalik;
    //_disController.text = _randevuData.;
    _tarihController.text = _randevuData.randevuTarihi.toIso8601String();
    _saatController.text = _randevuData.randevuSaati.toIso8601String();
    _ucretController.text = _randevuData.ucret.toString();
  }
}
