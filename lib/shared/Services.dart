import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:view_selfservice/model/models.dart';

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));

String payloadToJson(Payload data) => json.encode(data.toJson());
Payload payload;
Payload payload2;
Payload payload3;
String ipaaddress;
String userlogin;
String passwordlogin;
String hrgroup;





getyear()async{
  debugPrint("yeaaar");

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  ipaaddress= prefs.getString("address");
  passwordlogin= prefs.getString("passwordlogin");
  userlogin= prefs.getString("userlogin");
  hrgroup= prefs.getString("Hrgrop");
  debugPrint("user:;"+passwordlogin+userlogin+hrgroup);
  String url =(
      "http://$ipaaddress/php_rest_myblog/api/data/dyn_sel.php?user=$userlogin&password=$passwordlogin&select=select%20period_year%20from%20user_year%20where%20user_name='$userlogin'order%20by%20%20period_year"
  );

  http.Response response = await http.get(url);
  debugPrint(url);
  debugPrint(response.body);
  return json.decode(response.body);
}
getsysdate()async{
  debugPrint("sysdate");

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  ipaaddress= prefs.getString("address");
  passwordlogin= prefs.getString("passwordlogin");
  userlogin= prefs.getString("userlogin");
  hrgroup= prefs.getString("Hrgrop");
  debugPrint("user:;"+passwordlogin+userlogin+hrgroup);
  String url =(
      "http://$ipaaddress/php_rest_myblog/api/data/dyn_sel.php?user=$userlogin&password=$passwordlogin&select=select%20to_char(sysdate)sys%20from%20dual"
  );

  http.Response response = await http.get(url);
  debugPrint(url);
  debugPrint(response.body);
  return json.decode(response.body);
}


getloan()async{
  debugPrint("goooo");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  ipaaddress= prefs.getString("address");
  passwordlogin= prefs.getString("passwordlogin");
  userlogin= prefs.getString("userlogin");
  hrgroup= prefs.getString("Hrgrop");
  Map periodyear = await getyear();
  String yearperiod = periodyear["data"][0]["period_year"];
  String data =
      "http://$ipaaddress/php_rest_myblog/api/data/dyn_sel.php?user=$userlogin&password=$passwordlogin&select=select%20nvl(max(nvl(loan_req_code,0)),0)%20+%201%20loan_req_code%20from%20hr_pay_emp_loans_req%20where%20hr_emp_group_code%20=%201%20and%20to_char(loan_start_date,%27yyyy%27)%20=%20$yearperiod";

  debugPrint("url:"+data);
  http.Response response = await http.get(data);
  debugPrint(response.body);
  return json.decode(response.body);




}

loan_req_id() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  ipaaddress= prefs.getString("address");
  passwordlogin= prefs.getString("passwordlogin");
  userlogin= prefs.getString("userlogin");
  hrgroup= prefs.getString("Hrgrop");
  http.Response loanId = await http.get('http://$ipaaddress/php_rest_myblog/api/data/dyn_sel.php?user=$userlogin&password=$passwordlogin&select=select%20create_id(%27hr_pay_emp_loans_req%27,%27loan_req_id%27)%20loan_req_id%20from%20dual');

  return json.decode(loanId.body);
}




