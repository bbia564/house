
import 'package:get/get.dart';
import 'package:my_house/db_house/house_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBHouse extends GetxService {
  late Database dbBase;

  Future<DBHouse> init() async {
    await createHouseDB();
    return this;
  }

  createHouseDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'house.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createHouseTable(db);
          await createTenantTable(db);
        });
  }

  createHouseTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS house (id INTEGER PRIMARY KEY, createdTime TEXT, houseId INTEGER, area REAL, type INTEGER, equipments TEXT, hadRent INTEGER)');
  }

  createTenantTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS tenant (id INTEGER PRIMARY KEY, createdTime TEXT, name TEXT, phone TEXT, bindId INTEGER, houseId INTEGER)');
  }

  insertHouse(HouseEntity entity) async {
    final id = await dbBase.insert('house', {
      'createdTime': entity.createdTime.toIso8601String(),
      'houseId': entity.houseId,
      'area': entity.area,
      'type': entity.type,
      'equipments': entity.equipments,
      'hadRent': entity.hadRent,
    });
    return id;
  }

  updateHouse(HouseEntity entity) async {
    await dbBase.update('house', {
      'houseId': entity.houseId,
      'area': entity.area,
      'type': entity.type,
      'equipments': entity.equipments,
      'hadRent': entity.hadRent,
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  insertTenant(Tenant entity) async {
    final id = await dbBase.insert('tenant', {
      'createdTime': entity.createdTime.toIso8601String(),
      'name': entity.name,
      'phone': entity.phone,
      'bindId': entity.bindId,
      'houseId': entity.houseId,
    });
    return id;
  }

  updateTenant(Tenant entity) async {
    await dbBase.update('tenant', {
      'name': entity.name,
      'phone': entity.phone,
      'bindId': entity.bindId,
      'houseId': entity.houseId,
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanAllData() async {
    await dbBase.delete('house');
    await dbBase.delete('tenant');
  }

  Future<List<HouseEntity>> getHouseAllData() async {
    var result = await dbBase.query('house', orderBy: 'createdTime DESC');
    return result.map((e) => HouseEntity.fromJson(e)).toList();
  }

  Future<List<Tenant>> getTenantAllData() async {
    var result = await dbBase.query('tenant', orderBy: 'createdTime DESC');
    return result.map((e) => Tenant.fromJson(e)).toList();
  }
}
