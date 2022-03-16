import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:view_selfservice/model/models.dart';
import 'package:view_selfservice/providers/test_provider.dart';

// ignore: camel_case_types
class first extends StatefulWidget {
  @override
  firstState createState() => firstState();
}

TextEditingController ipaddress = TextEditingController();
TextEditingController userlogin = TextEditingController();
TextEditingController passwordlogin = TextEditingController();

// ignore: camel_case_types
class firstState extends State<first> {
  dynamic orgs;

  bool isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      // getData().then((value) {
      //   debugPrint(value);
      setState(() {
        isInit = false;
        // });
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TestProvider>(
        builder: (context, testProvider, child) => Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.deepPurple,
                  title: const Text('first Page')),
              body: isInit
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: [
                                TextField(
                                  style: const TextStyle(
                                      fontSize: 15.0, color: Colors.deepPurple),
                                  controller: ipaddress,
                                  decoration: const InputDecoration(
                                    labelText: 'Ip address',
                                    icon: Icon(
                                      Icons.person,
                                      color: Colors.deepPurple,
                                      size: 15.0,
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                                TextField(
                                  style: const TextStyle(
                                      fontSize: 15.0, color: Colors.deepPurple),
                                  controller: userlogin,
                                  onSubmitted: (s) {
                                    testProvider.getDatainfo(ipaddress.text,
                                        userlogin.text, passwordlogin.text);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: ' User Name',
                                    icon: Icon(
                                      Icons.person,
                                      color: Colors.deepPurple,
                                      size: 15.0,
                                    ),
                                    // hintText: ' User Name:'
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                                TextField(
                                  style: const TextStyle(
                                      fontSize: 15.0, color: Colors.deepPurple),
                                  controller: passwordlogin,
                                  onSubmitted: (s) {
                                    testProvider.getDatainfo(ipaddress.text,
                                        userlogin.text, passwordlogin.text);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'User Password',
                                    icon: Icon(
                                      Icons.lock,
                                      color: Colors.deepPurple,
                                      size: 15.0,
                                    ),
                                  ),
                                  obscureText: true,
                                ),
                                // TextField(
                                //   style: const TextStyle(
                                //       fontSize: 15.0, color: Colors.deepPurple),
                                //   controller: userController,
                                //   onTap: () {
                                //     if(testProvider.payload==null)
                                //     testProvider.getDatainfo(
                                //         ipaddress.text,
                                //         userlogin.text,
                                //         passwordlogin.text);
                                //   },
                                //   decoration: const InputDecoration(
                                //     labelText: 'User Login:',
                                //       icon: Icon(
                                //         Icons.person,
                                //         color: Colors.deepPurple,
                                //         size: 15.0,
                                //       ),),
                                //   keyboardType: TextInputType.number,
                                // ),
                                // TextField(
                                //   style: const TextStyle(
                                //       fontSize: 15.0, color: Colors.deepPurple),
                                //   controller: passwordController,
                                //   decoration: const InputDecoration(
                                //     labelText: 'Password Login:',
                                //       icon: Icon(
                                //         Icons.lock,
                                //         color: Colors.deepPurple,
                                //         size: 10.0,
                                //       ),
                                //      ),
                                //   obscureText: true,
                                // ),
                                (testProvider.payload == null &&
                                        testProvider.payload2 == null &&
                                        testProvider.payload3 == null &&
                                        testProvider.payload4 == null)
                                    ? Container()
                                    : Column(
                                        children: [
                                          Container(
                                            child: InputDecorator(
                                              decoration: InputDecoration(
                                                labelText: 'ChooseOrg',
                                              ),
                                              child: DropdownButton<dynamic>(
                                                value:
                                                    testProvider.dropdownValue,
                                                isExpanded: true,
                                                icon: Icon(
                                                    Icons.check_circle_outline),
                                                iconSize: 15,
                                                // elevation: 15,
                                                style: TextStyle(
                                                    color: Colors.deepPurple),
                                                underline: Container(
                                                  height: 2,
                                                  color: Colors.blue[300],
                                                ),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    testProvider.dropdownValue =
                                                        newValue;
                                                    debugPrint(testProvider
                                                        .dropdownValue.org_id);
                                                    debugPrint(ipaddress.text);
                                                  });
                                                },
                                                items: testProvider.payload.data
                                                    .map<
                                                        DropdownMenuItem<
                                                            Datum>>((value) {
                                                  return DropdownMenuItem<
                                                          Datum>(
                                                      value: value,
                                                      child: Text(
                                                          ' ${value.group_name}'));
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: InputDecorator(
                                              decoration: InputDecoration(
                                                labelText: 'ChooseCompany',
                                              ),
                                              child: DropdownButton<Datum>(
                                                value:
                                                    testProvider.dropdownValue2,
                                                isExpanded: true,
                                                icon: Icon(
                                                    Icons.check_circle_outline),
                                                iconSize: 15,
                                                // elevation: 5,
                                                style: TextStyle(
                                                    color: Colors.deepPurple),
                                                underline: Container(
                                                  height: 2,
                                                  color: Colors.blue[300],
                                                ),
                                                onChanged: (Datum newValue) {
                                                  setState(() {
                                                    testProvider
                                                            .dropdownValue2 =
                                                        newValue;
                                                    debugPrint(testProvider
                                                        .dropdownValue2
                                                        .comp_code);
                                                  });
                                                },
                                                items: testProvider
                                                    .payload2.data
                                                    .map<
                                                            DropdownMenuItem<
                                                                Datum>>(
                                                        (Datum value) {
                                                  return DropdownMenuItem<
                                                          Datum>(
                                                      value: value,
                                                      child: Text(
                                                          ' ${value.comp_name}'));
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: InputDecorator(
                                              decoration: InputDecoration(
                                                labelText: 'Choose Branch',
                                              ),
                                              child: DropdownButton<Datum>(
                                                value:
                                                    testProvider.dropdownValue3,
                                                isExpanded: true,
                                                icon: Icon(
                                                    Icons.check_circle_outline),
                                                iconSize: 15,
                                                elevation: 16,
                                                style: TextStyle(
                                                    color: Colors.deepPurple),
                                                underline: Container(
                                                  height: 2,
                                                  color: Colors.blue[300],
                                                ),
                                                onChanged: (Datum newValue) {
                                                  setState(() {
                                                    testProvider
                                                            .dropdownValue3 =
                                                        newValue;
                                                    debugPrint(testProvider
                                                        .dropdownValue3
                                                        .branch_code);
                                                  });
                                                },
                                                items: testProvider
                                                    .payload3.data
                                                    .map<
                                                            DropdownMenuItem<
                                                                Datum>>(
                                                        (Datum value) {
                                                  return DropdownMenuItem<
                                                          Datum>(
                                                      value: value,
                                                      child: Text(
                                                          ' ${value.branch_name}'));
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: InputDecorator(
                                              decoration: InputDecoration(
                                                labelText: 'Choose Year',
                                              ),
                                              child: DropdownButton<Datum>(
                                                value:
                                                    testProvider.dropdownValue4,
                                                isExpanded: true,
                                                icon: Icon(
                                                    Icons.check_circle_outline),
                                                iconSize: 15,
                                                elevation: 16,
                                                style: TextStyle(
                                                    color: Colors.deepPurple),
                                                underline: Container(
                                                  height: 2,
                                                  color: Colors.blue[300],
                                                ),
                                                onChanged: (Datum newValue) {
                                                  setState(() {
                                                    testProvider
                                                            .dropdownValue4 =
                                                        newValue;
                                                    debugPrint(testProvider
                                                        .dropdownValue4
                                                        .period_year);
                                                  });
                                                },
                                                items: testProvider
                                                    .payload4.data
                                                    .map<
                                                            DropdownMenuItem<
                                                                Datum>>(
                                                        (Datum value) {
                                                  return DropdownMenuItem<
                                                          Datum>(
                                                      value: value,
                                                      child: Text(
                                                          ' ${value.period_year}'));
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              bottomNavigationBar: ElevatedButton(
                  onPressed: () {
                    Provider.of<TestProvider>(context, listen: false).onLogin(
                        // Provider.of<TestProvider>(context, listen: false).getHR_GROUP_CODE(
                        ipaddress.text,
                        // userController.text,
                        // passwordController.text,
                        userlogin.text,
                        passwordlogin.text,
                        // testProvider.dropdownValue.org_id,
                        // dropdownValue2.comp_code,
                        // dropdownValue3.branch_code,
                        context);
                    // Navigator.of(context).pushNamed('/First');
                    // debugPrint(ipaddress.text);
                  },
                  child: Text("Login")),
            ));
  }
}
