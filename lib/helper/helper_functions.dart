import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  //keys
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userAgeKey = "USERAGEKEY";
  static String userPhoneKey = "USERPHONE";
  static String userState = "USERSTATE";
  static String userUniversity = "USERUNIVERSITY";
  static String userCity = "USERCITY";
  static String userBranch = "USERBRANCH";
  static String userSem = "USERSEM";
  // saving the data to SF

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }

  static Future<bool> saveUserAgeSF(String userAge) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userAgeKey, userAge);
  }

  static Future<bool> saveUserPhoneSF(String userPhone) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userPhoneKey, userPhone);
  }

  static Future<bool> saveUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }

  static Future<bool> userStudentorWorking(String current) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userState, current);
  }

  static Future<bool> userUniversityName(String uni) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userUniversity, uni);
  }

  static Future<bool> userCityName(String city) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userCity, city);
  }

  static Future<bool> userBranchName(String branch) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userBranch, branch);
  }

  static Future<bool> userCurrentSem(String sem) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userSem, sem);
  }
  // getting the data from SF

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }

  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }
}
