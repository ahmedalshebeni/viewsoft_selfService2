import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:view_selfservice/providers/test_provider.dart';

class Menuitems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Menuitem(),
    );
  }
}

class Menuitem extends StatefulWidget {
  @override
  _MenuitemState createState() => _MenuitemState();
}

class _MenuitemState extends State<Menuitem> {
  // String txt = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Self Services Page')),
      body: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage('img/viewsoft.png'))), child: null,
            ),
            ListTile(
              leading: Icon(Icons.local_florist_sharp),
              title: const Text('LoansTransaction Page'),
              onTap: () {
                 // context.read<TestProvider>().getItemsUnit();
                // context.read<TestProvider>().getorgs();
                // context.read<TestProvider>().getData();
                Navigator.of(context).pushNamed('/main');
              },
            ),
            ListTile(
              leading: Icon(Icons.volunteer_activism),
              title: const Text('Vacation requests Page'),
              onTap: () {
                Navigator.of(context).pushNamed('/Leave Request');
              },
            ),
            ListTile(
              leading: Icon(Icons.perm_identity),
              title: const Text('Enter employee permissions Page'),
              onTap: () {
                Navigator.of(context).pushNamed('/I_Time');
              },
            ),
            ListTile(
              leading: Icon(Icons.admin_panel_settings),
              title: const Text('Entering staff assignments Page'),
              onTap: () {
                Navigator.of(context).pushNamed('/Pay Roll Report');
              },
            ),
            ListTile(
              leading: Icon(Icons.android),
              title: const Text('Permissions Allowed Page'),
              onTap: () {
                Navigator.of(context).pushNamed('/changesetting');
              },
            ),
            ListTile(
              leading: Icon(Icons.call_missed_outgoing_rounded),
              title: const Text('Entering errands during a period Page'),
              onTap: () {
                Navigator.of(context).pushNamed('/Enteringerrandsduringaperiod');
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: const Text(' Attendance And Departure Page'),
              onTap: () {
                Navigator.of(context).pushNamed('/AttendanceandDeparture');
              },
            ),
            ListTile(
              leading: Icon(Icons.pageview_rounded),
              title: const Text(' salary report Page'),
              onTap: () {
                Navigator.of(context).pushNamed('/salary report');
              },
            ),
            ListTile(
                leading: Icon(Icons.exit_to_app),
                title: const Text('LogOut'),
                onTap: () {
                  Provider.of<TestProvider>(context, listen: false).logout();
                }),
          ],
        ),
      ),
    );
  }
}
