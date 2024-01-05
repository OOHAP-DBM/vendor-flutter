import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('Shared preferences initialized');
  }

  void clearPrefData() async {
    _sharedPreferences!.clear();
  }

  String? getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData');
    } catch (e) {
      return 'primary';
    }
  }

  Future<void> setId(String value) async {
    await _sharedPreferences!.setString('id', value);
    return;
  }

  String getId() {
    try {
      return _sharedPreferences!.getString('id') ?? '';
    } catch (e) {
      return '';
    }
  }
}

// Init this
/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PrefUtils prefUtils = PrefUtils();
  await prefUtils.init();

  runApp(MyApp());
}*/
