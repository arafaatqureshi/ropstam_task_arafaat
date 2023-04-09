import 'package:flutter/cupertino.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';
import '../model/user_model.dart';

class UserViewModel with ChangeNotifier{

  String dbPath = 'sample.db';
  DatabaseFactory dbFactory = databaseFactoryIo;
  var store = StoreRef.main();

  Future<bool> saveUser(User user) async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbpath= '${appDocumentDir.path}'+"/"+'demo.db';
    Database db = await dbFactory.openDatabase(dbpath);
    await store.record('token').put(db, user.token.toString());
    return true;

  }

  Future<User> getUser() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbpath= '${appDocumentDir.path}'+"/"+'demo.db';
    Database db = await dbFactory.openDatabase(dbpath);
  var token = await store.record('token').get(db);
  return User(
      token: token.toString()
  );
  }

  Future<bool> deleteUser() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbpath= '${appDocumentDir.path}'+"/"+'demo.db';
    Database db = await dbFactory.openDatabase(dbpath);
    await store.record('token').put(db, 'null');
    return true;

  }

}