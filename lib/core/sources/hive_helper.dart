import 'package:hive_flutter/hive_flutter.dart';

// const kUsersBox = "sdsasad";
// const kLectureBox = "lecture box";
// const kSectionBox = "section box";
// const kTeacherBox = "teacher box";

class HiveHelper {
  static Future init() async {
    await Hive.initFlutter();
    // Hive.registerAdapter(AddressAdapter());
    // await Hive.openBox(kUsersBox);
  }

  static Future saveData(dynamic data, String boxName) async {
    final box = await _prepareBox(boxName);
    box.addAll(data);
  }

  static removeBookData(dynamic data, String boxName) async {
    await Hive.openBox(boxName).then((box) => box.delete(data));
  }

  static Future<void> clear() async {
    await Hive.deleteFromDisk();
  }

  static Future<Box> _prepareBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    } else {
      return Hive.openBox(boxName);
    }
  }
}
