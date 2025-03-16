import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taxi_booking/network/network_repository.dart';
import 'package:taxi_booking/service/network_monitor.dart';
import 'screens/splash/SplashScreen.dart';
import 'utils/Colors.dart';
import 'utils/Constants.dart';

Color textPrimaryColorGlobal = textPrimaryColor;
Color textSecondaryColorGlobal = textSecondaryColor;
Color defaultLoaderBgColorGlobal = Colors.white;
final networkRepository = NetworkRepository();
final navigatorKey = GlobalKey<NavigatorState>();
final networkMonitor = NetworkMonitor();
final appStorage = GetStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: mAppName,
      home: SplashScreen(),
    );
  }
}
