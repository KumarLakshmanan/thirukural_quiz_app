
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String registrationKey = 'registration_completed';
  static const String _stageCompletionKey = 'stage_completion';
  static const String keyName = 'user_name';
  static const String keyGender = 'user_gender';
  static const String keyDateOfBirth = 'user_dob';
  static const String keyDisability = 'user_disability';

  static Future<void> saveUserDetails({
    required String name,
    required String gender,
    required String dateOfBirth,
    required String disability,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyName, name);
    await prefs.setString(keyGender, gender);
    await prefs.setString(keyDateOfBirth, dateOfBirth);
    await prefs.setString(keyDisability, disability);
  }

  static Future<Map<String, String>> getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString(keyName) ?? '',
      'gender': prefs.getString(keyGender) ?? '',
      'dateOfBirth': prefs.getString(keyDateOfBirth) ?? '',
      'disability': prefs.getString(keyDisability) ?? '',
    };
  }

  static Future<bool> isRegistrationCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(keyName);
    final gender = prefs.getString(keyGender);
    final dateOfBirth = prefs.getString(keyDateOfBirth);
    final disability = prefs.getString(keyDisability);
    
    return name != null && 
           name.isNotEmpty && 
           gender != null && 
           gender.isNotEmpty && 
           dateOfBirth != null && 
           dateOfBirth.isNotEmpty && 
           disability != null && 
           disability.isNotEmpty;
  }

  static Future<void> setStageCompleted(int levelIndex, int stageIndex) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '${_stageCompletionKey}_${levelIndex}_$stageIndex';
    await prefs.setBool(key, true);
  }

  static Future<bool> isStageCompleted(int levelIndex, int stageIndex) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '${_stageCompletionKey}_${levelIndex}_$stageIndex';
    return prefs.getBool(key) ?? false;
  }
}