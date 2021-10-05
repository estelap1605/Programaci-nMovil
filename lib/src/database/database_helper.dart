
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:practica_2/src/models/notas_model.dart';
import 'package:practica_2/src/models/profile_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{

  static final _nombreBD = 'NOTASBD';
  static final _versionBD = 2;
  static final _nombreTBL = 'tblNotas';
  static final _nombreTBL2 ='tblUsers';


  //met
  static Database? _database;
  Future<Database?> get database async {
    if(_database !=null) return _database;
    _database = await _initDatabase();
    return _database;
  }

 Future<Database> _initDatabase() async {
    Directory carpeta = await getApplicationDocumentsDirectory();
    String rutaBD = join(carpeta.path,_nombreBD);
    return openDatabase(
       rutaBD, version: _versionBD, onCreate: _crearTabla,
    );
 }
 
 Future<void> _crearTabla(Database db, int version) async {
   await db.execute("CREATE TABLE $_nombreTBL (id INTEGER PRIMARY KEY, titulo VARCHAR(50), detalle VARCHAR(100))");
   await db.execute("CREATE TABLE $_nombreTBL2 (id INTEGER PRIMARY KEY, nombre varchar(50), apaterno varchar(50), amaterno varchar(50), telefono varchar(20), email varchar(100), avatar varchar(200))");
 }

 //nos regresara el id del valor insertado
  Future<int> insert(Map<String,dynamic> row) async{
    //asegurarse de recuperar la conexion
   var conexion = await database;
    return conexion!.insert(_nombreTBL, row);
    return conexion!.insert(_nombreTBL2,row);
  }
  //nos regresara el id del valor insertado
  Future<int> insert2(Map<String,dynamic> row) async{
    //asegurarse de recuperar la conexion
    var conexion = await database;
  //  return conexion!.insert(_nombreTBL, row);
    return conexion!.insert(_nombreTBL2,row);
  }

  Future<int> update(Map<String,dynamic> row) async{
     var conexion = await database;
    // return conexion!.update(_nombreTBL, row, where: 'id = ?', whereArgs: [row['id']]);
     return conexion!.update(_nombreTBL, row, where: 'id = $row["id"]');
  }

  Future<int> update2(Map<String,dynamic> row) async{
    var conexion = await database;
     return conexion!.update(_nombreTBL2, row, where: 'id = 1');
  //  return conexion!.update(_nombreTBL2, row, where: 'id = $row["id"]');
  }

  //mejor solo pasar el id, se puede con el mapa pero finalmente el unico valor que se necesita es el id
  Future<int> delete(int id) async {
    var conexion = await database;
    return await conexion!.delete(_nombreTBL, where: 'id = ?',whereArgs: [id]);
  }


  //vamos a regresar una lista de notas Model , una lista de objetos
  Future<List<NotasModel>> getAllNotes() async {
    var conexion = await database;
    //query es como un select  , una lista de mapas
    var result = await conexion!.query(_nombreTBL);
  //se va a iterar entre cada elemento de la lista y recupera el mapa  asi nos regresa una lista de objetos
   return result.map((notaMap) => NotasModel.fromMap(notaMap)).toList();
  }
  Future<NotasModel> getNote(int id) async {
      var conexion = await database;
      var result = await conexion!.query(_nombreTBL, where: 'id = ?', whereArgs: ['id']);
     // return result.map((notaMap) => NotasModel.fromMap(notaMap)).first;
     return NotasModel.fromMap(result.first);
  }
  Future<List<ProfileModel>> getAllPerfil() async {
    var conexion = await database;
    //query es como un select  , una lista de mapas
    var result = await conexion!.query(_nombreTBL2);
    //se va a iterar entre cada elemento de la lista y recupera el mapa  asi nos regresa una lista de objetos
    return result.map((notaMap) => ProfileModel.fromMap(notaMap)).toList();
  }
}