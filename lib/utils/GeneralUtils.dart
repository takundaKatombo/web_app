

import 'package:web_app/model/ConfigData.dart';

bool isThisAuthorized(String methodToCall)
{
  if (ConfigData().adminUser) return false ; // Show componenet ie do NOT move OffStage
  if (ConfigData().RBAMap.containsKey(methodToCall))
  {
   // var dict:Array = config.authorizationDict[methodToCall] as Array;
    for (int i=0; i< ConfigData().RBAMap.length ; i++)
    {
      if (ConfigData().roles.contains(ConfigData().RBAMap[i]))
      {
        return false ; // Show componenet ie do NOT move OffStage
      }
    }
  }
  return true ; // Dont show componet ie DO move OffStage
}