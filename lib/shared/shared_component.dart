// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:view_selfservice/model/models.dart';
// import 'package:view_selfservice/shared/share.dart';
//
// Payload payload;
// Datum dropdownValue =null;
// bool isInit = true;
//
// Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));
// String payloadToJson(Payload data) => json.encode(data.toJson());
//
// class dropbox extends StatefulWidget {
//   @override
//   _dropboxState createState() => _dropboxState();
// }
//
// class _dropboxState extends State<dropbox> {
// @override
//   void didChangeDependencies() {
//     // TODO: implement initState
//   if (isInit) {
//     getData().then((value) {
//       setState(() {
//         isInit=false;
//       });
//     });
//   }
//     super.didChangeDependencies();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       isInit ?Center(child:
//       // Text("errrorrr")
//       CircularProgressIndicator()
//       )  :Container(
//       child: DropdownButton<Datum>(
//         hint: Text('الورديـه'),
//         value:dropdownValue ,
//         isExpanded: true,
//         icon: Icon(Icons.check_circle_outline),
//         iconSize: 24,
//         elevation: 16,
//         style: TextStyle(color: Colors.deepPurple),
//         underline: Container(
//           height: double.infinity,
//           color: Colors.blue[300],
//         ),
//         onChanged: (newValue) {
//           setState(() {
//             dropdownValue = newValue;
//             debugPrint(dropdownValue.org_id);
//           });
//         },
//         items: payload.data.map<DropdownMenuItem<Datum>>((value) {
//           return DropdownMenuItem<Datum>(
//               value: value, child: Text('${value.group_name}'));
//         }).toList(),
//       ),
//     );
//   }
// }
