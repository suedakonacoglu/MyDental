import 'dart:io';
import 'package:github_client/data/entity/database.dart';
import 'package:path/path.dart' as path;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'mydental.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Randevu, Doktor, Hasta, Hastalik])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  Future<List<HastaData>> getHastalar() async {
    return await (select(hasta)
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.tckn)]))
        .get();
  }

  Future<HastaData> getHasta(String tckn) async {
    return await (select(hasta)..where((tbl) => tbl.tckn.equals(tckn)))
        .getSingle();
  }

  Future<bool> updateHasta(HastaCompanion entity) async {
    return await update(hasta).replace(entity);
  }

  Future<int> insertHasta(HastaCompanion entity) async {
    return await into(hasta).insert(entity);
  }

  Future<int> deleteHasta(String tckn) async {
    return await (delete(hasta)..where((tbl) => tbl.tckn.equals(tckn))).go();
  }

  Future<List<DoktorData>> getDoktors() async {
    return await (select(doktor)
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.doktorTC)]))
        .get();
  }

  Future<DoktorData> getDoktor(String tckn) async {
    return await (select(doktor)..where((tbl) => tbl.doktorTC.equals(tckn)))
        .getSingle();
  }

  Future<bool> updateDoktor(DoktorCompanion entity) async {
    return await update(doktor).replace(entity);
  }

  Future<int> insertDoktor(DoktorCompanion entity) async {
    return await into(doktor).insert(entity);
  }

  Future<int> deleteDoktor(String tckn) async {
    return await (delete(doktor)..where((tbl) => tbl.doktorTC.equals(tckn)))
        .go();
  }

  Future<List<HastalikData>> getHastaliklar() async {
    return await select(hastalik).get();
  }

  Future<HastalikData> getHastalik(String name) async {
    return await (select(hastalik)..where((tbl) => tbl.proses.equals(name)))
        .getSingle();
  }

  Future<bool> updateHastalik(HastalikCompanion entity) async {
    return await update(hastalik).replace(entity);
  }

  Future<int> insertHastalik(HastalikCompanion entity) async {
    return await into(hastalik).insert(entity);
  }

  Future<int> deleteHastalik(String name) async {
    return await (delete(hastalik)..where((tbl) => tbl.proses.equals(name)))
        .go();
  }

  Future<List<RandevuData>> getRandevular() async {
    return await select(randevu).get();
  }

  Future<List<RandevuData>> getHastaRandevular(String tckn) async {
    return await (select(randevu)..where((tbl) => tbl.hasta.equals(tckn)))
        .get();
  }

  Future<RandevuData> getRandevu(int id) async {
    return await (select(randevu)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateRandevu(RandevuCompanion entity) async {
    return await update(randevu).replace(entity);
  }

  Future<int> insertRandevu(RandevuCompanion entity) async {
    return await into(randevu).insert(entity);
  }

  Future<int> deleteRandevu(int id) async {
    return await (delete(randevu)..where((tbl) => tbl.id.equals(id))).go();
  }
}
