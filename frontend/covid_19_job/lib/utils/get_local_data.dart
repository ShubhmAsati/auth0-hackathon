import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:covid_19_job/global/global.dart' as globals;
class GetLocalData{
  GetLocalData();
  static String key = "USER_HASH" ;

  static Future<bool> DoesKeyExist()async{
    String value = await globals.UserData.read(key: key);
    if (value == null){
      return false;
    }
    return value.isNotEmpty;
  }
  static Future<String> GetUserHash()async{
   bool doesExist =  await DoesKeyExist();
   if (doesExist) {
     String userHash = await globals.UserData.read(key: key);
     print(userHash + "some summrtr");
     return userHash;
   }else {
     return '';
   }
  }
  static Future<bool> AddHash(String hashValue)async{
   globals.UserData.write(key: key, value: hashValue).then((value){
     return true;
   }).catchError((onError){
     print(onError);
     return false;
   });
  }

  static Future<bool> UpdateHash(String newHashValue)async{
    globals.UserData.delete(key: key).then((value)async {
      return await AddHash(newHashValue);
    }).catchError((onError){
      return false;
    });
  }

}