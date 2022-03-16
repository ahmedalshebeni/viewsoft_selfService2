import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:view_selfservice/Gui/Enter%20employee%20permissions.dart';
import 'package:view_selfservice/Gui/loginfirst.dart';
import 'package:view_selfservice/Gui/salary%20report.dart';
import 'Gui/Attendance and Departure.dart';
import 'Gui/Enteringerrandsduringaperiod.dart';
import 'Gui/Enteringstaffassignments.dart';
import 'Gui/Vacation requests.dart';
import 'Gui/Menuitem.dart';
import 'Gui/Permissionsallowed.dart';
import 'Gui/LoansTransaction.dart';
import 'Gui/loginfirst.dart';
import 'providers/test_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: TestProvider(),
      child: MaterialApp(
        routes: <String, WidgetBuilder>{
          '/First': (BuildContext context) => Menuitem(),
          '/first': (BuildContext context) => first(),
          '/main': (BuildContext context) => LoansTransaction(),
          '/Leave Request': (BuildContext context) => Vacationrequests(),
          '/I_Time': (BuildContext context) => Enteremployeepermissions(),
          '/Pay Roll Report': (BuildContext context) => Enteringstaffassignments(),
          '/changesetting': (BuildContext context) => Permissionsallowed(),
          '/Enteringerrandsduringaperiod': (BuildContext context) => Enteringerrandsduringaperiod(),
          '/AttendanceandDeparture': (BuildContext context) => AttendanceandDeparture(),
          '/salary report': (BuildContext context) => salaryreport(),
        },
        home:splash2(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// ignore: camel_case_types
class splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: SecondScreen(),
      title: const Text(
        'Welcome...',
        textScaleFactor: 2,
      ),
      image: Image.network(
          'https://i.vimeocdn.com/portrait/26270325_120x120.jpg'
        // 'https://www.geeksforgeeks.org/wp-content/uploads/gfg_200X200.png'
      ),
      loadingText: const Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );

  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TestProvider>(
      builder: (ctx, testProvider, _) =>
      testProvider.ipaaddress != null &&
      testProvider.userlogin != null &&
      testProvider.passwordlogin != null
          ? Menuitem()
          : FutureBuilder(
          future:
          Provider.of<TestProvider>(context, listen: false).getData(),
          builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Scaffold(
            body: Center(
              child: const Text('Loading...'),
            ),
          )
          :first()

      ),
    );
  }
}
