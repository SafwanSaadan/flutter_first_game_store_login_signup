// ignore_for_file: file_names
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// class SqlDb{

//   intialDb() async{
//     String databasepath = await getDatabasesPath();    //  االمسار الذي تخزن فيها البيانا getDatabasesPath هي داله تحدد المسار الافتراضي لجميع الاجهزه
//     String path = join(databasepath, "GSH.db"); //path تربط المسار مع اسم قاعده البيانات  //join  تعمل / وترجع المسار الثابت databasepath/GSH.db 
    
//     Database gshdb = await openDatabase(path, onCreate: _onCreate);
//    return gshdb;
//   }

//   _onCreate(Database db, int version) async {   //الانشاء الجداول 
//                                                             //execute    sqlلستخدلم اوامر  
//     await db.execute('''             
// CREATE TABLE "sing_up"(
//   id INTEGER AUTOINCREMENT PRIMARY KEY ,
//   usern_ame TEXT  NOT NULL ,
//   email TEXT  NOT NULL ,
// )

//     ''');
//      await db.execute('''             
// CREATE TABLE "login"(
//   id INTEGER AUTOINCREMENT PRIMARY KEY ,
//   email TEXT  NOT NULL ,
// )

//     ''');
//     print("Create DATABASE AND TABLE ======");
//     }
// }