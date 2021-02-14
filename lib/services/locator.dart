import 'package:get_it/get_it.dart';
import 'package:web_app/controllers/bottomnotifications.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(() => BottomNotifications());
}
