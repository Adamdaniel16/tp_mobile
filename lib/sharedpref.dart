import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {

  static Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> save(String name, int difficulty) async {
    final prefs = await SharedPreferences.getInstance();
    int id = prefs.getKeys().length + 1;
    await prefs.setString(id as String, name);
    await prefs.setInt(id as String, difficulty);
  }

  static Future<List<Tuple3<int, String, int>>> getAllData() async {
    final prefs = await getInstance();
    final allKeys = prefs.getKeys();
    final data = <Tuple2<String, int>>[];

    for (int i = 0; i < allKeys.length; i++) {
      final key = allKeys.elementAt(i);
      final value = prefs.getInt(key);
      data.add(Tuple2(key, value ?? 0));
    }
    final sortedData = data.toList()..sort((a, b) => b.niveau - a.niveau);

    final res = <Tuple3<int, String, int>>[];
    for (int i = 0; i < sortedData.length; i++) {
      var elem = sortedData.elementAt(i);
      res.add(Tuple3(i+1, elem.name, elem.niveau ?? 0));
    }
    return res;
  }
}

class Tuple2<T1, T2> {
  final T1 name;
  final T2 niveau;

  const Tuple2(this.name, this.niveau);

  @override
  String toString() {
    return '($name, $niveau)';
  }
}

class Tuple3<T1, T2, T3> {
  final T1 position;
  final T2 name;
  final T3 niveau;

  const Tuple3(this.position, this.name, this.niveau);

  @override
  String toString() {
    return '($position, $name, $niveau)';
  }
}
