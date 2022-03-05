import 'package:injectable/injectable.dart';
import 'package:note_flutter/core/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
@Injectable()
class SharedData {

  SharedData(){
    prefs;
  }

  static SharedPreferences? _prefs;

  Future<SharedPreferences> get prefs async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }


  Future<bool?> saveViewValue(String value) async
  {
      return _prefs?.setString(Constants.VALUE_VIEW_KEY, value);
  }
  Future<String?> getViewValue() async
  {
    print("vvvvvvvvvvvvvvvvvvvvalue ${_prefs?.getString(Constants.VALUE_VIEW_KEY)}");
    return _prefs?.getString(Constants.VALUE_VIEW_KEY);
  }

}