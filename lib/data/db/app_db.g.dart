// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class RandevuData extends DataClass implements Insertable<RandevuData> {
  final int id;
  final String hasta;
  final String doctor;
  final DateTime randevuTarihi;
  final DateTime randevuSaati;
  final String hastalik;
  final String ucret;
  final String dis;
  const RandevuData(
      {required this.id,
      required this.hasta,
      required this.doctor,
      required this.randevuTarihi,
      required this.randevuSaati,
      required this.hastalik,
      required this.ucret,
      required this.dis});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['hasta_tc_no'] = Variable<String>(hasta);
    map['doctor'] = Variable<String>(doctor);
    map['randevu_tarihi'] = Variable<DateTime>(randevuTarihi);
    map['randevu_saati'] = Variable<DateTime>(randevuSaati);
    map['islem'] = Variable<String>(hastalik);
    map['ucret'] = Variable<String>(ucret);
    map['dis_adi'] = Variable<String>(dis);
    return map;
  }

  RandevuCompanion toCompanion(bool nullToAbsent) {
    return RandevuCompanion(
      id: Value(id),
      hasta: Value(hasta),
      doctor: Value(doctor),
      randevuTarihi: Value(randevuTarihi),
      randevuSaati: Value(randevuSaati),
      hastalik: Value(hastalik),
      ucret: Value(ucret),
      dis: Value(dis),
    );
  }

  factory RandevuData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RandevuData(
      id: serializer.fromJson<int>(json['id']),
      hasta: serializer.fromJson<String>(json['hasta']),
      doctor: serializer.fromJson<String>(json['doctor']),
      randevuTarihi: serializer.fromJson<DateTime>(json['randevuTarihi']),
      randevuSaati: serializer.fromJson<DateTime>(json['randevuSaati']),
      hastalik: serializer.fromJson<String>(json['hastalik']),
      ucret: serializer.fromJson<String>(json['ucret']),
      dis: serializer.fromJson<String>(json['dis']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hasta': serializer.toJson<String>(hasta),
      'doctor': serializer.toJson<String>(doctor),
      'randevuTarihi': serializer.toJson<DateTime>(randevuTarihi),
      'randevuSaati': serializer.toJson<DateTime>(randevuSaati),
      'hastalik': serializer.toJson<String>(hastalik),
      'ucret': serializer.toJson<String>(ucret),
      'dis': serializer.toJson<String>(dis),
    };
  }

  RandevuData copyWith(
          {int? id,
          String? hasta,
          String? doctor,
          DateTime? randevuTarihi,
          DateTime? randevuSaati,
          String? hastalik,
          String? ucret,
          String? dis}) =>
      RandevuData(
        id: id ?? this.id,
        hasta: hasta ?? this.hasta,
        doctor: doctor ?? this.doctor,
        randevuTarihi: randevuTarihi ?? this.randevuTarihi,
        randevuSaati: randevuSaati ?? this.randevuSaati,
        hastalik: hastalik ?? this.hastalik,
        ucret: ucret ?? this.ucret,
        dis: dis ?? this.dis,
      );
  @override
  String toString() {
    return (StringBuffer('RandevuData(')
          ..write('id: $id, ')
          ..write('hasta: $hasta, ')
          ..write('doctor: $doctor, ')
          ..write('randevuTarihi: $randevuTarihi, ')
          ..write('randevuSaati: $randevuSaati, ')
          ..write('hastalik: $hastalik, ')
          ..write('ucret: $ucret, ')
          ..write('dis: $dis')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, hasta, doctor, randevuTarihi, randevuSaati, hastalik, ucret, dis);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RandevuData &&
          other.id == this.id &&
          other.hasta == this.hasta &&
          other.doctor == this.doctor &&
          other.randevuTarihi == this.randevuTarihi &&
          other.randevuSaati == this.randevuSaati &&
          other.hastalik == this.hastalik &&
          other.ucret == this.ucret &&
          other.dis == this.dis);
}

class RandevuCompanion extends UpdateCompanion<RandevuData> {
  final Value<int> id;
  final Value<String> hasta;
  final Value<String> doctor;
  final Value<DateTime> randevuTarihi;
  final Value<DateTime> randevuSaati;
  final Value<String> hastalik;
  final Value<String> ucret;
  final Value<String> dis;
  const RandevuCompanion({
    this.id = const Value.absent(),
    this.hasta = const Value.absent(),
    this.doctor = const Value.absent(),
    this.randevuTarihi = const Value.absent(),
    this.randevuSaati = const Value.absent(),
    this.hastalik = const Value.absent(),
    this.ucret = const Value.absent(),
    this.dis = const Value.absent(),
  });
  RandevuCompanion.insert({
    this.id = const Value.absent(),
    required String hasta,
    required String doctor,
    required DateTime randevuTarihi,
    required DateTime randevuSaati,
    required String hastalik,
    required String ucret,
    required String dis,
  })  : hasta = Value(hasta),
        doctor = Value(doctor),
        randevuTarihi = Value(randevuTarihi),
        randevuSaati = Value(randevuSaati),
        hastalik = Value(hastalik),
        ucret = Value(ucret),
        dis = Value(dis);
  static Insertable<RandevuData> custom({
    Expression<int>? id,
    Expression<String>? hasta,
    Expression<String>? doctor,
    Expression<DateTime>? randevuTarihi,
    Expression<DateTime>? randevuSaati,
    Expression<String>? hastalik,
    Expression<String>? ucret,
    Expression<String>? dis,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hasta != null) 'hasta_tc_no': hasta,
      if (doctor != null) 'doctor': doctor,
      if (randevuTarihi != null) 'randevu_tarihi': randevuTarihi,
      if (randevuSaati != null) 'randevu_saati': randevuSaati,
      if (hastalik != null) 'islem': hastalik,
      if (ucret != null) 'ucret': ucret,
      if (dis != null) 'dis_adi': dis,
    });
  }

  RandevuCompanion copyWith(
      {Value<int>? id,
      Value<String>? hasta,
      Value<String>? doctor,
      Value<DateTime>? randevuTarihi,
      Value<DateTime>? randevuSaati,
      Value<String>? hastalik,
      Value<String>? ucret,
      Value<String>? dis}) {
    return RandevuCompanion(
      id: id ?? this.id,
      hasta: hasta ?? this.hasta,
      doctor: doctor ?? this.doctor,
      randevuTarihi: randevuTarihi ?? this.randevuTarihi,
      randevuSaati: randevuSaati ?? this.randevuSaati,
      hastalik: hastalik ?? this.hastalik,
      ucret: ucret ?? this.ucret,
      dis: dis ?? this.dis,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hasta.present) {
      map['hasta_tc_no'] = Variable<String>(hasta.value);
    }
    if (doctor.present) {
      map['doctor'] = Variable<String>(doctor.value);
    }
    if (randevuTarihi.present) {
      map['randevu_tarihi'] = Variable<DateTime>(randevuTarihi.value);
    }
    if (randevuSaati.present) {
      map['randevu_saati'] = Variable<DateTime>(randevuSaati.value);
    }
    if (hastalik.present) {
      map['islem'] = Variable<String>(hastalik.value);
    }
    if (ucret.present) {
      map['ucret'] = Variable<String>(ucret.value);
    }
    if (dis.present) {
      map['dis_adi'] = Variable<String>(dis.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RandevuCompanion(')
          ..write('id: $id, ')
          ..write('hasta: $hasta, ')
          ..write('doctor: $doctor, ')
          ..write('randevuTarihi: $randevuTarihi, ')
          ..write('randevuSaati: $randevuSaati, ')
          ..write('hastalik: $hastalik, ')
          ..write('ucret: $ucret, ')
          ..write('dis: $dis')
          ..write(')'))
        .toString();
  }
}

class $RandevuTable extends Randevu with TableInfo<$RandevuTable, RandevuData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RandevuTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _hastaMeta = const VerificationMeta('hasta');
  @override
  late final GeneratedColumn<String> hasta = GeneratedColumn<String>(
      'hasta_tc_no', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _doctorMeta = const VerificationMeta('doctor');
  @override
  late final GeneratedColumn<String> doctor = GeneratedColumn<String>(
      'doctor', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _randevuTarihiMeta =
      const VerificationMeta('randevuTarihi');
  @override
  late final GeneratedColumn<DateTime> randevuTarihi =
      GeneratedColumn<DateTime>('randevu_tarihi', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _randevuSaatiMeta =
      const VerificationMeta('randevuSaati');
  @override
  late final GeneratedColumn<DateTime> randevuSaati = GeneratedColumn<DateTime>(
      'randevu_saati', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _hastalikMeta = const VerificationMeta('hastalik');
  @override
  late final GeneratedColumn<String> hastalik = GeneratedColumn<String>(
      'islem', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _ucretMeta = const VerificationMeta('ucret');
  @override
  late final GeneratedColumn<String> ucret = GeneratedColumn<String>(
      'ucret', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _disMeta = const VerificationMeta('dis');
  @override
  late final GeneratedColumn<String> dis = GeneratedColumn<String>(
      'dis_adi', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, hasta, doctor, randevuTarihi, randevuSaati, hastalik, ucret, dis];
  @override
  String get aliasedName => _alias ?? 'randevu';
  @override
  String get actualTableName => 'randevu';
  @override
  VerificationContext validateIntegrity(Insertable<RandevuData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('hasta_tc_no')) {
      context.handle(_hastaMeta,
          hasta.isAcceptableOrUnknown(data['hasta_tc_no']!, _hastaMeta));
    } else if (isInserting) {
      context.missing(_hastaMeta);
    }
    if (data.containsKey('doctor')) {
      context.handle(_doctorMeta,
          doctor.isAcceptableOrUnknown(data['doctor']!, _doctorMeta));
    } else if (isInserting) {
      context.missing(_doctorMeta);
    }
    if (data.containsKey('randevu_tarihi')) {
      context.handle(
          _randevuTarihiMeta,
          randevuTarihi.isAcceptableOrUnknown(
              data['randevu_tarihi']!, _randevuTarihiMeta));
    } else if (isInserting) {
      context.missing(_randevuTarihiMeta);
    }
    if (data.containsKey('randevu_saati')) {
      context.handle(
          _randevuSaatiMeta,
          randevuSaati.isAcceptableOrUnknown(
              data['randevu_saati']!, _randevuSaatiMeta));
    } else if (isInserting) {
      context.missing(_randevuSaatiMeta);
    }
    if (data.containsKey('islem')) {
      context.handle(_hastalikMeta,
          hastalik.isAcceptableOrUnknown(data['islem']!, _hastalikMeta));
    } else if (isInserting) {
      context.missing(_hastalikMeta);
    }
    if (data.containsKey('ucret')) {
      context.handle(
          _ucretMeta, ucret.isAcceptableOrUnknown(data['ucret']!, _ucretMeta));
    } else if (isInserting) {
      context.missing(_ucretMeta);
    }
    if (data.containsKey('dis_adi')) {
      context.handle(
          _disMeta, dis.isAcceptableOrUnknown(data['dis_adi']!, _disMeta));
    } else if (isInserting) {
      context.missing(_disMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RandevuData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RandevuData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      hasta: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}hasta_tc_no'])!,
      doctor: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}doctor'])!,
      randevuTarihi: attachedDatabase.options.types.read(
          DriftSqlType.dateTime, data['${effectivePrefix}randevu_tarihi'])!,
      randevuSaati: attachedDatabase.options.types.read(
          DriftSqlType.dateTime, data['${effectivePrefix}randevu_saati'])!,
      hastalik: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}islem'])!,
      ucret: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}ucret'])!,
      dis: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}dis_adi'])!,
    );
  }

  @override
  $RandevuTable createAlias(String alias) {
    return $RandevuTable(attachedDatabase, alias);
  }
}

class DoktorData extends DataClass implements Insertable<DoktorData> {
  final String doktorTC;
  final String isimSoyisim;
  final String telNo;
  const DoktorData(
      {required this.doktorTC, required this.isimSoyisim, required this.telNo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['doktor_tc'] = Variable<String>(doktorTC);
    map['isim_soyisim'] = Variable<String>(isimSoyisim);
    map['doctor_tel_no'] = Variable<String>(telNo);
    return map;
  }

  DoktorCompanion toCompanion(bool nullToAbsent) {
    return DoktorCompanion(
      doktorTC: Value(doktorTC),
      isimSoyisim: Value(isimSoyisim),
      telNo: Value(telNo),
    );
  }

  factory DoktorData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoktorData(
      doktorTC: serializer.fromJson<String>(json['doktorTC']),
      isimSoyisim: serializer.fromJson<String>(json['isimSoyisim']),
      telNo: serializer.fromJson<String>(json['telNo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'doktorTC': serializer.toJson<String>(doktorTC),
      'isimSoyisim': serializer.toJson<String>(isimSoyisim),
      'telNo': serializer.toJson<String>(telNo),
    };
  }

  DoktorData copyWith({String? doktorTC, String? isimSoyisim, String? telNo}) =>
      DoktorData(
        doktorTC: doktorTC ?? this.doktorTC,
        isimSoyisim: isimSoyisim ?? this.isimSoyisim,
        telNo: telNo ?? this.telNo,
      );
  @override
  String toString() {
    return (StringBuffer('DoktorData(')
          ..write('doktorTC: $doktorTC, ')
          ..write('isimSoyisim: $isimSoyisim, ')
          ..write('telNo: $telNo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(doktorTC, isimSoyisim, telNo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoktorData &&
          other.doktorTC == this.doktorTC &&
          other.isimSoyisim == this.isimSoyisim &&
          other.telNo == this.telNo);
}

class DoktorCompanion extends UpdateCompanion<DoktorData> {
  final Value<String> doktorTC;
  final Value<String> isimSoyisim;
  final Value<String> telNo;
  const DoktorCompanion({
    this.doktorTC = const Value.absent(),
    this.isimSoyisim = const Value.absent(),
    this.telNo = const Value.absent(),
  });
  DoktorCompanion.insert({
    required String doktorTC,
    required String isimSoyisim,
    required String telNo,
  })  : doktorTC = Value(doktorTC),
        isimSoyisim = Value(isimSoyisim),
        telNo = Value(telNo);
  static Insertable<DoktorData> custom({
    Expression<String>? doktorTC,
    Expression<String>? isimSoyisim,
    Expression<String>? telNo,
  }) {
    return RawValuesInsertable({
      if (doktorTC != null) 'doktor_tc': doktorTC,
      if (isimSoyisim != null) 'isim_soyisim': isimSoyisim,
      if (telNo != null) 'doctor_tel_no': telNo,
    });
  }

  DoktorCompanion copyWith(
      {Value<String>? doktorTC,
      Value<String>? isimSoyisim,
      Value<String>? telNo}) {
    return DoktorCompanion(
      doktorTC: doktorTC ?? this.doktorTC,
      isimSoyisim: isimSoyisim ?? this.isimSoyisim,
      telNo: telNo ?? this.telNo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (doktorTC.present) {
      map['doktor_tc'] = Variable<String>(doktorTC.value);
    }
    if (isimSoyisim.present) {
      map['isim_soyisim'] = Variable<String>(isimSoyisim.value);
    }
    if (telNo.present) {
      map['doctor_tel_no'] = Variable<String>(telNo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoktorCompanion(')
          ..write('doktorTC: $doktorTC, ')
          ..write('isimSoyisim: $isimSoyisim, ')
          ..write('telNo: $telNo')
          ..write(')'))
        .toString();
  }
}

class $DoktorTable extends Doktor with TableInfo<$DoktorTable, DoktorData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoktorTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _doktorTCMeta = const VerificationMeta('doktorTC');
  @override
  late final GeneratedColumn<String> doktorTC = GeneratedColumn<String>(
      'doktor_tc', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _isimSoyisimMeta =
      const VerificationMeta('isimSoyisim');
  @override
  late final GeneratedColumn<String> isimSoyisim = GeneratedColumn<String>(
      'isim_soyisim', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _telNoMeta = const VerificationMeta('telNo');
  @override
  late final GeneratedColumn<String> telNo = GeneratedColumn<String>(
      'doctor_tel_no', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [doktorTC, isimSoyisim, telNo];
  @override
  String get aliasedName => _alias ?? 'doktor';
  @override
  String get actualTableName => 'doktor';
  @override
  VerificationContext validateIntegrity(Insertable<DoktorData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('doktor_tc')) {
      context.handle(_doktorTCMeta,
          doktorTC.isAcceptableOrUnknown(data['doktor_tc']!, _doktorTCMeta));
    } else if (isInserting) {
      context.missing(_doktorTCMeta);
    }
    if (data.containsKey('isim_soyisim')) {
      context.handle(
          _isimSoyisimMeta,
          isimSoyisim.isAcceptableOrUnknown(
              data['isim_soyisim']!, _isimSoyisimMeta));
    } else if (isInserting) {
      context.missing(_isimSoyisimMeta);
    }
    if (data.containsKey('doctor_tel_no')) {
      context.handle(_telNoMeta,
          telNo.isAcceptableOrUnknown(data['doctor_tel_no']!, _telNoMeta));
    } else if (isInserting) {
      context.missing(_telNoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DoktorData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoktorData(
      doktorTC: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}doktor_tc'])!,
      isimSoyisim: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}isim_soyisim'])!,
      telNo: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}doctor_tel_no'])!,
    );
  }

  @override
  $DoktorTable createAlias(String alias) {
    return $DoktorTable(attachedDatabase, alias);
  }
}

class HastaData extends DataClass implements Insertable<HastaData> {
  final String tckn;
  final String firstName;
  final String lastNmae;
  final String gender;
  final DateTime dateOfBirth;
  final String telno;
  const HastaData(
      {required this.tckn,
      required this.firstName,
      required this.lastNmae,
      required this.gender,
      required this.dateOfBirth,
      required this.telno});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['tckn'] = Variable<String>(tckn);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastNmae);
    map['gender'] = Variable<String>(gender);
    map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    map['tel_no'] = Variable<String>(telno);
    return map;
  }

  HastaCompanion toCompanion(bool nullToAbsent) {
    return HastaCompanion(
      tckn: Value(tckn),
      firstName: Value(firstName),
      lastNmae: Value(lastNmae),
      gender: Value(gender),
      dateOfBirth: Value(dateOfBirth),
      telno: Value(telno),
    );
  }

  factory HastaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HastaData(
      tckn: serializer.fromJson<String>(json['tckn']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastNmae: serializer.fromJson<String>(json['lastNmae']),
      gender: serializer.fromJson<String>(json['gender']),
      dateOfBirth: serializer.fromJson<DateTime>(json['dateOfBirth']),
      telno: serializer.fromJson<String>(json['telno']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tckn': serializer.toJson<String>(tckn),
      'firstName': serializer.toJson<String>(firstName),
      'lastNmae': serializer.toJson<String>(lastNmae),
      'gender': serializer.toJson<String>(gender),
      'dateOfBirth': serializer.toJson<DateTime>(dateOfBirth),
      'telno': serializer.toJson<String>(telno),
    };
  }

  HastaData copyWith(
          {String? tckn,
          String? firstName,
          String? lastNmae,
          String? gender,
          DateTime? dateOfBirth,
          String? telno}) =>
      HastaData(
        tckn: tckn ?? this.tckn,
        firstName: firstName ?? this.firstName,
        lastNmae: lastNmae ?? this.lastNmae,
        gender: gender ?? this.gender,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        telno: telno ?? this.telno,
      );
  @override
  String toString() {
    return (StringBuffer('HastaData(')
          ..write('tckn: $tckn, ')
          ..write('firstName: $firstName, ')
          ..write('lastNmae: $lastNmae, ')
          ..write('gender: $gender, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('telno: $telno')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(tckn, firstName, lastNmae, gender, dateOfBirth, telno);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HastaData &&
          other.tckn == this.tckn &&
          other.firstName == this.firstName &&
          other.lastNmae == this.lastNmae &&
          other.gender == this.gender &&
          other.dateOfBirth == this.dateOfBirth &&
          other.telno == this.telno);
}

class HastaCompanion extends UpdateCompanion<HastaData> {
  final Value<String> tckn;
  final Value<String> firstName;
  final Value<String> lastNmae;
  final Value<String> gender;
  final Value<DateTime> dateOfBirth;
  final Value<String> telno;
  const HastaCompanion({
    this.tckn = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastNmae = const Value.absent(),
    this.gender = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.telno = const Value.absent(),
  });
  HastaCompanion.insert({
    required String tckn,
    required String firstName,
    required String lastNmae,
    required String gender,
    required DateTime dateOfBirth,
    required String telno,
  })  : tckn = Value(tckn),
        firstName = Value(firstName),
        lastNmae = Value(lastNmae),
        gender = Value(gender),
        dateOfBirth = Value(dateOfBirth),
        telno = Value(telno);
  static Insertable<HastaData> custom({
    Expression<String>? tckn,
    Expression<String>? firstName,
    Expression<String>? lastNmae,
    Expression<String>? gender,
    Expression<DateTime>? dateOfBirth,
    Expression<String>? telno,
  }) {
    return RawValuesInsertable({
      if (tckn != null) 'tckn': tckn,
      if (firstName != null) 'first_name': firstName,
      if (lastNmae != null) 'last_name': lastNmae,
      if (gender != null) 'gender': gender,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (telno != null) 'tel_no': telno,
    });
  }

  HastaCompanion copyWith(
      {Value<String>? tckn,
      Value<String>? firstName,
      Value<String>? lastNmae,
      Value<String>? gender,
      Value<DateTime>? dateOfBirth,
      Value<String>? telno}) {
    return HastaCompanion(
      tckn: tckn ?? this.tckn,
      firstName: firstName ?? this.firstName,
      lastNmae: lastNmae ?? this.lastNmae,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      telno: telno ?? this.telno,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tckn.present) {
      map['tckn'] = Variable<String>(tckn.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastNmae.present) {
      map['last_name'] = Variable<String>(lastNmae.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (telno.present) {
      map['tel_no'] = Variable<String>(telno.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HastaCompanion(')
          ..write('tckn: $tckn, ')
          ..write('firstName: $firstName, ')
          ..write('lastNmae: $lastNmae, ')
          ..write('gender: $gender, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('telno: $telno')
          ..write(')'))
        .toString();
  }
}

class $HastaTable extends Hasta with TableInfo<$HastaTable, HastaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HastaTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _tcknMeta = const VerificationMeta('tckn');
  @override
  late final GeneratedColumn<String> tckn = GeneratedColumn<String>(
      'tckn', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _lastNmaeMeta = const VerificationMeta('lastNmae');
  @override
  late final GeneratedColumn<String> lastNmae = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
      'date_of_birth', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _telnoMeta = const VerificationMeta('telno');
  @override
  late final GeneratedColumn<String> telno = GeneratedColumn<String>(
      'tel_no', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [tckn, firstName, lastNmae, gender, dateOfBirth, telno];
  @override
  String get aliasedName => _alias ?? 'hasta';
  @override
  String get actualTableName => 'hasta';
  @override
  VerificationContext validateIntegrity(Insertable<HastaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tckn')) {
      context.handle(
          _tcknMeta, tckn.isAcceptableOrUnknown(data['tckn']!, _tcknMeta));
    } else if (isInserting) {
      context.missing(_tcknMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNmaeMeta,
          lastNmae.isAcceptableOrUnknown(data['last_name']!, _lastNmaeMeta));
    } else if (isInserting) {
      context.missing(_lastNmaeMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['date_of_birth']!, _dateOfBirthMeta));
    } else if (isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    if (data.containsKey('tel_no')) {
      context.handle(
          _telnoMeta, telno.isAcceptableOrUnknown(data['tel_no']!, _telnoMeta));
    } else if (isInserting) {
      context.missing(_telnoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  HastaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HastaData(
      tckn: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}tckn'])!,
      firstName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastNmae: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      gender: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
      dateOfBirth: attachedDatabase.options.types.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_of_birth'])!,
      telno: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}tel_no'])!,
    );
  }

  @override
  $HastaTable createAlias(String alias) {
    return $HastaTable(attachedDatabase, alias);
  }
}

class HastalikData extends DataClass implements Insertable<HastalikData> {
  final int id;
  final String proses;
  final String hastalikAdi;
  final String money;
  final String dis;
  const HastalikData(
      {required this.id,
      required this.proses,
      required this.hastalikAdi,
      required this.money,
      required this.dis});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['proses'] = Variable<String>(proses);
    map['hastalik_adi'] = Variable<String>(hastalikAdi);
    map['money'] = Variable<String>(money);
    map['dis'] = Variable<String>(dis);
    return map;
  }

  HastalikCompanion toCompanion(bool nullToAbsent) {
    return HastalikCompanion(
      id: Value(id),
      proses: Value(proses),
      hastalikAdi: Value(hastalikAdi),
      money: Value(money),
      dis: Value(dis),
    );
  }

  factory HastalikData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HastalikData(
      id: serializer.fromJson<int>(json['id']),
      proses: serializer.fromJson<String>(json['proses']),
      hastalikAdi: serializer.fromJson<String>(json['hastalikAdi']),
      money: serializer.fromJson<String>(json['money']),
      dis: serializer.fromJson<String>(json['dis']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'proses': serializer.toJson<String>(proses),
      'hastalikAdi': serializer.toJson<String>(hastalikAdi),
      'money': serializer.toJson<String>(money),
      'dis': serializer.toJson<String>(dis),
    };
  }

  HastalikData copyWith(
          {int? id,
          String? proses,
          String? hastalikAdi,
          String? money,
          String? dis}) =>
      HastalikData(
        id: id ?? this.id,
        proses: proses ?? this.proses,
        hastalikAdi: hastalikAdi ?? this.hastalikAdi,
        money: money ?? this.money,
        dis: dis ?? this.dis,
      );
  @override
  String toString() {
    return (StringBuffer('HastalikData(')
          ..write('id: $id, ')
          ..write('proses: $proses, ')
          ..write('hastalikAdi: $hastalikAdi, ')
          ..write('money: $money, ')
          ..write('dis: $dis')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, proses, hastalikAdi, money, dis);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HastalikData &&
          other.id == this.id &&
          other.proses == this.proses &&
          other.hastalikAdi == this.hastalikAdi &&
          other.money == this.money &&
          other.dis == this.dis);
}

class HastalikCompanion extends UpdateCompanion<HastalikData> {
  final Value<int> id;
  final Value<String> proses;
  final Value<String> hastalikAdi;
  final Value<String> money;
  final Value<String> dis;
  const HastalikCompanion({
    this.id = const Value.absent(),
    this.proses = const Value.absent(),
    this.hastalikAdi = const Value.absent(),
    this.money = const Value.absent(),
    this.dis = const Value.absent(),
  });
  HastalikCompanion.insert({
    this.id = const Value.absent(),
    required String proses,
    required String hastalikAdi,
    required String money,
    required String dis,
  })  : proses = Value(proses),
        hastalikAdi = Value(hastalikAdi),
        money = Value(money),
        dis = Value(dis);
  static Insertable<HastalikData> custom({
    Expression<int>? id,
    Expression<String>? proses,
    Expression<String>? hastalikAdi,
    Expression<String>? money,
    Expression<String>? dis,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (proses != null) 'proses': proses,
      if (hastalikAdi != null) 'hastalik_adi': hastalikAdi,
      if (money != null) 'money': money,
      if (dis != null) 'dis': dis,
    });
  }

  HastalikCompanion copyWith(
      {Value<int>? id,
      Value<String>? proses,
      Value<String>? hastalikAdi,
      Value<String>? money,
      Value<String>? dis}) {
    return HastalikCompanion(
      id: id ?? this.id,
      proses: proses ?? this.proses,
      hastalikAdi: hastalikAdi ?? this.hastalikAdi,
      money: money ?? this.money,
      dis: dis ?? this.dis,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (proses.present) {
      map['proses'] = Variable<String>(proses.value);
    }
    if (hastalikAdi.present) {
      map['hastalik_adi'] = Variable<String>(hastalikAdi.value);
    }
    if (money.present) {
      map['money'] = Variable<String>(money.value);
    }
    if (dis.present) {
      map['dis'] = Variable<String>(dis.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HastalikCompanion(')
          ..write('id: $id, ')
          ..write('proses: $proses, ')
          ..write('hastalikAdi: $hastalikAdi, ')
          ..write('money: $money, ')
          ..write('dis: $dis')
          ..write(')'))
        .toString();
  }
}

class $HastalikTable extends Hastalik
    with TableInfo<$HastalikTable, HastalikData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HastalikTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _prosesMeta = const VerificationMeta('proses');
  @override
  late final GeneratedColumn<String> proses = GeneratedColumn<String>(
      'proses', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _hastalikAdiMeta =
      const VerificationMeta('hastalikAdi');
  @override
  late final GeneratedColumn<String> hastalikAdi = GeneratedColumn<String>(
      'hastalik_adi', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _moneyMeta = const VerificationMeta('money');
  @override
  late final GeneratedColumn<String> money = GeneratedColumn<String>(
      'money', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _disMeta = const VerificationMeta('dis');
  @override
  late final GeneratedColumn<String> dis = GeneratedColumn<String>(
      'dis', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, proses, hastalikAdi, money, dis];
  @override
  String get aliasedName => _alias ?? 'hastalik';
  @override
  String get actualTableName => 'hastalik';
  @override
  VerificationContext validateIntegrity(Insertable<HastalikData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('proses')) {
      context.handle(_prosesMeta,
          proses.isAcceptableOrUnknown(data['proses']!, _prosesMeta));
    } else if (isInserting) {
      context.missing(_prosesMeta);
    }
    if (data.containsKey('hastalik_adi')) {
      context.handle(
          _hastalikAdiMeta,
          hastalikAdi.isAcceptableOrUnknown(
              data['hastalik_adi']!, _hastalikAdiMeta));
    } else if (isInserting) {
      context.missing(_hastalikAdiMeta);
    }
    if (data.containsKey('money')) {
      context.handle(
          _moneyMeta, money.isAcceptableOrUnknown(data['money']!, _moneyMeta));
    } else if (isInserting) {
      context.missing(_moneyMeta);
    }
    if (data.containsKey('dis')) {
      context.handle(
          _disMeta, dis.isAcceptableOrUnknown(data['dis']!, _disMeta));
    } else if (isInserting) {
      context.missing(_disMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HastalikData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HastalikData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      proses: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}proses'])!,
      hastalikAdi: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}hastalik_adi'])!,
      money: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}money'])!,
      dis: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}dis'])!,
    );
  }

  @override
  $HastalikTable createAlias(String alias) {
    return $HastalikTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $RandevuTable randevu = $RandevuTable(this);
  late final $DoktorTable doktor = $DoktorTable(this);
  late final $HastaTable hasta = $HastaTable(this);
  late final $HastalikTable hastalik = $HastalikTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [randevu, doktor, hasta, hastalik];
}
