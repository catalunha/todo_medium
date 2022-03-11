import 'package:synchronized/synchronized.dart';
import 'package:todo_medium/app/models/database/hive/hive_database.dart';

class HiveConnectionFactory {
  static HiveConnectionFactory? _instance;
  HiveConnectionFactory._();
  factory HiveConnectionFactory() {
    _instance ??= HiveConnectionFactory._();
    return _instance!;
  }

  HiveBase? _hiveDatabase;
  final _lock = Lock();

  Future<HiveBase> openConnection() async {
    if (_hiveDatabase == null) {
      await _lock.synchronized(() async {
        if (_hiveDatabase == null) {
          print('+++> openConnection HiveDatabase');
          _hiveDatabase = HiveBase();
          print('+++> openConnection HiveDatabase 1');
          await _hiveDatabase!.initInFlutter();
          print('+++> openConnection HiveDatabase 2');
          await _hiveDatabase!.addBox('todo');
          print('+++> openConnection HiveDatabase 3');
          var listBoxes = await _hiveDatabase!.listOfBoxes();
          print('+++> openConnection HiveDatabase 4');
          print(listBoxes);
          print('+++> openConnection HiveDatabase 5');
          // onConfigureBoxes();
        }
      });
    }
    print('---> openED Connection ...');
    return _hiveDatabase!;
  }

  // void onConfigureBoxes() async {}

  void closeConnection() {
    _hiveDatabase?.closeAll();
    _hiveDatabase = null;
  }
}
