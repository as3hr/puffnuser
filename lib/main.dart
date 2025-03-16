import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taxi_booking/network/network_repository.dart';
import 'package:taxi_booking/service/network_monitor.dart';
import 'screens/splash/SplashScreen.dart';
import 'utils/Constants.dart';

final networkRepository = NetworkRepository();
final navigatorKey = GlobalKey<NavigatorState>();
final networkMonitor = NetworkMonitor();
final appStorage = GetStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: mAppName,
      defaultTransition: Transition.fadeIn,
      home: SplashScreen(),
    );
  }
}
