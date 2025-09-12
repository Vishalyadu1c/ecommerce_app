

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {

  static StorageService get to => Get.find();
  late GetStorage _box;

  
  @override
  void onInit() async{
    super.onInit();
    // Initialize GetStorage
    await GetStorage.init();
    // Create an instance of GetStorage
    _box = GetStorage();
  }


  // Token Management
  String?getToken()=>_box.read('token');
  void setToken(String token)=> _box.write('token', token);
  void removeToken()=> _box.remove('token');


  // Language Management
  String? getLanguage() => _box.read('language');
  void setLanguage(String lang) => _box.write('language', lang);


  // Theme Management
  bool? isDarkTheme() => _box.read('theme') ?? false;
  void setDarkTheme(bool isDark) => _box.write('theme', isDark);


  // Generic Storage Methods
  T? getData<T>(String key) => _box.read<T>(key);
  void setData<T>(String key, T value) => _box.write(key, value);
  void removeData(String key) => _box.remove(key);
  void clearStorage() => _box.erase();

}