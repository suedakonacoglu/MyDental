import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:github_client/data/db/app_db.dart';
import 'package:github_client/widget/datepicker_textformfield.dart';
import 'package:github_client/widget/name_textformfield.dart';
import 'package:github_client/widget/number_textformfield.dart';
import 'package:github_client/widget/tema_widget.dart';
import 'package:intl/intl.dart';

late MyDatabase _db;
late HastalikData _hastalikData;
final TextEditingController _tcknController = TextEditingController();
final TextEditingController _disController = TextEditingController();
final TextEditingController _doktorController = TextEditingController();
final TextEditingController _tarihController = TextEditingController();
final TextEditingController _saatController = TextEditingController();
final TextEditingController _tedaviController = TextEditingController();

DateTime? _tarih, saat;
final now = DateTime.now();
double money = 0, sale = 0;
String indirim = 'Seçiniz',
    doktor = 'Seçiniz',
    tedavi = 'Seçiniz',
    dis = 'Seçiniz';

class RandevuEkle extends StatefulWidget {
  const RandevuEkle({super.key});

  @override
  State<RandevuEkle> createState() => _RandevuEkleState();
}

class _RandevuEkleState extends State<RandevuEkle> {
  final _formKey = GlobalKey<FormState>();
  final format = DateFormat('hh:mm');

  @override
  void initState() {
    _db = MyDatabase();
    super.initState();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  var indirimler = [
    'Seçiniz',
    '5',
    '10',
    '15',
    '20',
    '25',
    '30',
    '35',
    '40',
    '45',
    '50'
  ];
  var doktorlar = ['Seçiniz', 'Alican Edinsel', 'Orhan Alakuş'];

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
                          height: 525,
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
                                    child: NumberTextFormField(
                                      controller: _tcknController,
                                      txtLabel: "TC Kimlik Numarası",
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10, right: 10),
                                        child: Text(
                                          "Doktor seçiniz:",
                                          style: TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10, left: 10),
                                        child: DropdownButton(
                                          value: doktor,
                                          items:
                                              doktorlar.map((String doktorlar) {
                                            return DropdownMenuItem(
                                              value: doktorlar,
                                              child: Text(doktorlar),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              doktor = newValue!;
                                              _doktorController.text = newValue;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
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
                                          saat = DateTime(
                                              now.day,
                                              now.month,
                                              now.year,
                                              time!.hour,
                                              time.minute);
                                        });
                                        return DateTimeField.convert(time);
                                      },
                                      controller: _saatController,
                                      decoration: const InputDecoration(
                                          label: Text("Randevu Saati")),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: NameTextFormField(
                                      controller: _tedaviController,
                                      txtLabel: "Tedavi adı",
                                    ),
                                  ),
                                  /*Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10, right: 10),
                                        child: Text(
                                          "Tedavi seçiniz:",
                                          style: TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10, left: 10),
                                        child: DropdownButton(
                                          value: tedavi,
                                          items: hastalikIsimleri
                                              .map((String? tedaviler) {
                                            return DropdownMenuItem(
                                              value: hastalikIsimleri,
                                              child: Text(tedaviler!),
                                            );
                                          }).toList(),
                                          onChanged: (newValue) {
                                            setState(() {
                                              tedavi = newValue.toString();
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),*/
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: NameTextFormField(
                                      controller: _disController,
                                      txtLabel: "Diş giriniz:",
                                    ),
                                  ),
                                  /*
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10, right: 10),
                                        child: Text(
                                          "Diş seçiniz:",
                                          style: TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10, left: 10),
                                        child: DropdownButton(
                                          value: dis,
                                          items: disler.map((String? disler) {
                                            return DropdownMenuItem(
                                              value: disler,
                                              child: Text(disler!),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dis = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),*/
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10, right: 10),
                                        child: Text(
                                          "İndirim oranı seçiniz:",
                                          style: TextStyle(
                                            fontFamily: 'SourceSansPro',
                                            fontSize: 15.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10, left: 10),
                                        child: DropdownButton(
                                          value: indirim,
                                          items: indirimler
                                              .map((String indirimler) {
                                            return DropdownMenuItem(
                                              value: indirimler,
                                              child: Text(indirimler),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              indirim = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Tedavi(name: _tedaviController.text),
                                  )).then((_) => setState(() {}));
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.blue.shade900),
                            ),
                            child: const Text(
                              "İleri",
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
}

class Tedavi extends StatefulWidget {
  final String name;
  const Tedavi({required this.name, Key? key}) : super(key: key);

  @override
  State<Tedavi> createState() => _TedaviState();
}

class _TedaviState extends State<Tedavi> {
  final _formKey = GlobalKey<FormState>();

  Future<void> getUcret() async {
    _hastalikData = await _db.getHastalik(widget.name);
    double m = double.parse(_hastalikData.money);

    setState(() {
      money = m;
      sale = double.parse(indirim);
    });
  }

  double para = money * ((100 - sale) / 100);

  //double para = money * (100 - sale / 100);

  @override
  void initState() {
    super.initState();
    getUcret();
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
                        height: 250,
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
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Text(
                                    "Tedavi ücreti: $money",
                                    style: const TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Text(
                                    "Ödenecek tutar $para",
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
                            randevuEkle();
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

  void randevuEkle() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      final randevu = RandevuCompanion(
        hasta: drift.Value(_tcknController.text),
        doctor: drift.Value(_doktorController.text),
        randevuTarihi: drift.Value(_tarih!),
        randevuSaati: drift.Value(saat!),
        hastalik: drift.Value(_tedaviController.text),
        ucret: drift.Value(para.toString()),
        dis: drift.Value(_disController.text),
      );
      _db.insertRandevu(randevu).then(
            (value) => ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                backgroundColor: Colors.blueAccent,
                content: const Text(
                  'Randevu oluşturuldu',
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
}
