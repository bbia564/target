
import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_target/db_target/target_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBTarget extends GetxService {
  late Database dbBase;

  Future<DBTarget> init() async {
    await createTargetDB();
    return this;
  }

  createTargetDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'target.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createTargetTable(db);
        });
  }

  createTargetTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS target (id INTEGER PRIMARY KEY, createTime TEXT, title TEXT, content TEXT, colorType INTEGER, list TEXT)');
  }

  insertTarget(TargetEntity entity) async {
    final id = await dbBase.insert('target', {
      'createTime': entity.createTime.toIso8601String(),
      'title': entity.title,
      'content': entity.content,
      'colorType': entity.colorType,
      'list': jsonEncode(entity.list.map((e) => e.toJson()).toList()),
    });
    return id;
  }

  updateTarget(TargetEntity entity) async {
    await dbBase.update('target', {
      'createTime': entity.createTime.toIso8601String(),
      'title': entity.title,
      'content': entity.content,
      'colorType': entity.colorType,
      'list': jsonEncode(entity.list.map((e) => e.toJson()).toList()),
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanTargetData() async {
    await dbBase.delete('target');
  }

  Future<List<TargetEntity>> getTargetAllData() async {
    var result = await dbBase.query('target', orderBy: 'createTime DESC');
    return result.map((e) => TargetEntity.fromJson(e)).toList();
  }
}
