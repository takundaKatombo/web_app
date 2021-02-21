import 'package:intl/intl.dart';
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


/**
 * This makes the time 00:00:00
 */
DateTime dateFromString(String dateStr)
{

  DateTime formatter = DateFormat('EEE, d MMM yyyy HH:mm:ss').parse(dateStr);
// Option2 - also works
/*  dateStr += " GMT";
  DateTime parsedDate = HttpDate.parse(dateStr);
  */
  return formatter ;


}