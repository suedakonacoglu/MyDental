import 'package:drift/drift.dart';

class Randevu extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get hasta => text().named('hasta_tc_no')();
  TextColumn get doctor => text().named('doctor')();
  DateTimeColumn get randevuTarihi => dateTime().named('randevu_tarihi')();
  DateTimeColumn get randevuSaati => dateTime().named('randevu_saati')();
  TextColumn get hastalik => text().named('islem')();
  TextColumn get ucret => text().named('ucret')();
  TextColumn get dis => text().named('dis_adi')();
}

class Hasta extends Table {
  TextColumn get tckn => text().named('tckn')();
  TextColumn get firstName => text().named('first_name')();
  TextColumn get lastNmae => text().named('last_name')();
  TextColumn get gender => text().named('gender')();
  DateTimeColumn get dateOfBirth => dateTime().named('date_of_birth')();
  TextColumn get telno => text().named('tel_no')();
}

class Doktor extends Table {
  TextColumn get doktorTC => text().named('doktor_tc')();
  TextColumn get isimSoyisim => text().named('isim_soyisim')();
  TextColumn get telNo => text().named('doctor_tel_no')();
}

class Hastalik extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get proses => text().named('proses')();
  TextColumn get hastalikAdi => text().named('hastalik_adi')();
  TextColumn get money => text().named('money')();
  TextColumn get dis => text().named('dis')();
}
