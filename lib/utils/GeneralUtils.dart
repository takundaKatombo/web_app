//import 'package:web_app/src/data/ConfigData.dart';

bool isThisAuthorized(String methodToCall)
{
  return false ; // Show component ie do NOT move OffStage

  /*
  if (ConfigData().adminUser) return false ;
  if (ConfigData().RBAMap.containsKey(methodToCall))
  {
    // var dict:Array = config.authorizationDict[methodToCall] as Array;
    for (int i=0; i< ConfigData().RBAMap.length ; i++)
    {
      if (ConfigData().roles.contains(ConfigData().RBAMap[i]))
      {
        return false ; // Show component ie do NOT move OffStage
      }
    }
  }
  return true ; // Dont show component ie DO move OffStage

   */
}