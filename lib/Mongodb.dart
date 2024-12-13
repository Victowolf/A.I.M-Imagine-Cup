// ignore_for_file: unused_local_variable, file_names, depend_on_referenced_packages, unused_import, avoid_print
import 'dart:developer';
import 'const.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'home_page.dart';

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var status = db.serverStatus();
    print(status);
    var collection = db.collection(COLLECTION_NAME);
    await collection.insertOne(
      {
        'srno': '3',
        'name': 'Johana',
        'surname': 'khels',
        'age': '42',
        'mass': '73kg',
        'status': 'Alert',
        'device': 'disconnected',
        'room': '003'
      },
    );

    print(await collection.find().toList());
  }
}
