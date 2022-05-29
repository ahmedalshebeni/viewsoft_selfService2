// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'package:view_selfservice/Gui/loginfirst.dart';
// import 'package:view_selfservice/model/models.dart';
// // import 'package:view_selfservice/model/models.dart';
// //
// // // ignore: non_constant_identifier_names
// // var name;
// // var pass;
// // bool isInit = true;
// Payload payload;
// Payload payload3;
// Datum dropdownValue;
// Datum dropdownValue2;
// Datum dropdownValue3;
// Datum dropdownValue4;
//
// Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));
//
// String payloadToJson(Payload data) => json.encode(data.toJson());
//
// Future<dynamic> getLoan() async {
//   try {
// ipaddress.text;
//     var loan=await http.get(
//         "http://41.32.222.242/php_rest_myblog/api/data/dyn_sel.php?user=view&password=1&select=select%20loan_code,decode(1,2,eloan_name,loan_name)%20loan_name%20from%20hr_pay_loans%20where%20hr_group_code%20=%201%20order%20by%20loan_code");
//    payload=payloadFromJson(loan.body);
//     dropdownValue = payload.data[0];
//
//   } catch (err) {
//     debugPrint(err);
//     throw err;
//   }
// }
// popinfo(BuildContext context) {
//   final snackBar = SnackBar(
//     content: Text('تم تسجيل الحضور'),
//     action: SnackBarAction(
//       label: 'ok',
//       onPressed: () {
//         // Some code to undo the change.
//       },
//     ),
//   );
//
//   // Find the ScaffoldMessenger in the widget tree
//   // and use it to show a SnackBar.
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }
//
// pop(BuildContext context) {
//   final snackBar = SnackBar(
//     content: Text('تم تسجيل الحضورمن قبل'),
//     action: SnackBarAction(
//       label: 'ok',
//       onPressed: () {
//         // Some code to undo the change.
//       },
//     ),
//   );
//
//   // Find the ScaffoldMessenger in the widget tree
//   // and use it to show a SnackBar.
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }
//
// popinfoend(BuildContext context) {
//   final snackBar = SnackBar(
//     content: Text('تم تسجيل الانصراف'),
//     action: SnackBarAction(
//       label: 'ok',
//       onPressed: () {
//         // Some code to undo the change.
//       },
//     ),
//   );
//
//   // Find the ScaffoldMessenger in the widget tree
//   // and use it to show a SnackBar.
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }


