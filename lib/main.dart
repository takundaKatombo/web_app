import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:provider/provider.dart';
import 'package:web_app/controllers/SiteInit.dart';
import 'package:web_app/controllers/bottomnotifications.dart';
import 'package:web_app/services/locator.dart';
import 'package:web_app/services/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  afterConfig(await GlobalConfiguration().loadFromAsset("config.json"));
  runApp(MyApp());
}
void afterConfig(Object f) async
{
  // temp_SetLoggedInUser(); //Todo temp function until login sorted

  String configFileLevel = "Level."+GlobalConfiguration().get("LOGLEVEL");
  /*for (int i=0 ; i< Level.values.length ; i++)
  {
    if ( configFileLevel== Level.values[i].toString())
    {
      Logger.level = Level.values[i];
      break ;
    }
  }
  */
 // await SiteInit().initApp();
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNotifications>.value(
      //create: (_) => BottomNotifications(),
      value: locator<BottomNotifications>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Web App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      ),
    );
  }
}
