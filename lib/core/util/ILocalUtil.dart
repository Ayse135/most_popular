import 'package:shared_preferences/shared_preferences.dart';

mixin ILocalUtil {
  Future<String> getLocalData({String key}) async {
    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getString(key);
    }catch(_){
      return null;
    }
  }

  Future<void> addLocalData({String key, String value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
  }

  Future<void> deleteLocalData({String key}) async {
    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.remove(key);
    }catch(_){}
  }

  Future<void> clearLocalData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String firstLaunch = "";
    try{ firstLaunch=await getLocalData(key: "first_launch"); }catch(e){}

    await sharedPreferences.clear();

    try{ await addLocalData(key: "first_launch",value: firstLaunch); }catch(e){}
  }

}
