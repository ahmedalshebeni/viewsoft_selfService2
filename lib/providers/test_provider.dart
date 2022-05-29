import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:view_selfservice/model/models.dart';

class TestProvider with ChangeNotifier {
  Payload payload;
  Payload payload2;
  Payload payload3;
  Payload payload4;
  Payload payload5;
  String _ipaaddress;
  String _userLogin;
  String _passwordLogin;
  Datum dropdownValue;
  Datum dropdownValue2;
  Datum dropdownValue3;
  Datum dropdownValue4;
  // Datum dropdownValue5;
  // ignore: non_constant_identifier_names
  dynamic Hrgrop;
  // ignore: non_constant_identifier_names
  dynamic Hrempgrop;

  Locale _locale = Locale('ar');

  Locale get locale => _locale;

  void changeLocale(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }

  Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));

  String payloadToJson(Payload data) => json.encode(data.toJson());

  String get ipaaddress {
    return _ipaaddress;
  }

  String get userlogin {
    return _userLogin;
  }

  String get passwordlogin {
    return _passwordLogin;
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('address')) {
      return;
    }
    _ipaaddress = prefs.getString("address");
    notifyListeners();
    debugPrint("addres :" + _ipaaddress);

    if (!prefs.containsKey('userlogin')) {
      return;
    }
    _userLogin = prefs.getString("userlogin");
    notifyListeners();
    debugPrint("userlogin :" + _userLogin);

    if (!prefs.containsKey('passwordlogin')) {
      return;
    }
    _passwordLogin = prefs.getString("passwordlogin");
    notifyListeners();
    debugPrint("passwordlogin :" + _passwordLogin);
  }

  Future<void> setpref( String address,  String userlogin, String passwordlogin) async {
    _ipaaddress = address;
    _userLogin = userlogin;
    _passwordLogin = passwordlogin;
    Hrgrop=Hrgrop;
    notifyListeners();

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('address', address);
    sharedPreferences.setString('userlogin', userlogin);
    sharedPreferences.setString('passwordlogin', passwordlogin);
    sharedPreferences.setString('Hrgrop', Hrgrop);
  }

  Future<void> logout() async {
    _ipaaddress = null;
    _userLogin = null;
    _passwordLogin = null;
    notifyListeners();
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    notifyListeners();
  }

  getdata(String adress , String userlogin,  String passwordlogin  ) async {
    String url =
"http://$adress/php_rest_myblog/api/data/dyn_sel.php?user=$userlogin&password=$passwordlogin&select=select%20count(*)%20from%20app_users%20where%20user_name%20=%20'$userlogin'%20and%20user_pass%20=$passwordlogin";
 http.Response response = await http.get(url);
     debugPrint("getdata;;" + url);
    notifyListeners();
    return json.decode(response.body);
  }

  getEmpID(String adress, String userlogin, String passwordlogin) async {
    String url =
"http://$adress/php_rest_myblog/api/data/dyn_sel.php?user=$userlogin&password=$passwordlogin&select=select%20emp_id%20from%20app_users%20where%20user_name%20='$userlogin'";
    http.Response response = await http.get(url);
    debugPrint("getempid:::" + url);
    notifyListeners();
    return json.decode(response.body);
  }
// ignore: missing_return

  // ignore: non_constant_identifier_names
  getHR_GROUP_CODE(String adress, String userlogin, String passwordlogin)async  {
    var org= dropdownValue.org_id;
    var comp= dropdownValue2.comp_code;
    var branch= dropdownValue3.branch_code;
    // Map org = await getDatainfo(adress, userlogin, passwordlogin);
    // String GetEmp = Emp["data"][0]["emp_id"];
    // String check = datamap["data"][0]["count(*)"];
    // debugPrint(check);

String url =
"http://$adress/php_rest_myblog/api/data/dyn_sel.php?user=$userlogin&password=$passwordlogin&select=select%20HR_GROUP_CODE,HR_EMP_GROUP_CODE%20from%20branches%20where%20org_id%20=$org%20and%20comp_code%20=$comp and%20branch_code%20=$branch";
  http.Response response = await http.get(url);
  debugPrint("getempid:::" + url);
    debugPrint(comp);
    debugPrint(branch);
  notifyListeners();
  return json.decode(response.body);
  }

  Future<String> onLogin(String address, String userlogin, String passwordlogin, BuildContext context) async {
    Map datamap = await getdata(address, userlogin, passwordlogin);
    // ignore: non_constant_identifier_names
    Map Emp = await getEmpID(address, userlogin, passwordlogin);
    Map hrGroup = await getHR_GROUP_CODE(address, userlogin, passwordlogin);
    // ignore: non_constant_identifier_names
    String GetEmp = Emp["data"][0]["emp_id"];
    String check = datamap["data"][0]["count(*)"];
    // ignore: non_constant_identifier_names
     Hrgrop = hrGroup["data"][0]["hr_group_code"];
    // ignore: non_constant_identifier_names
     Hrempgrop = hrGroup["data"][0]["hr_emp_group_code"];
    debugPrint("Hrgrop:"+Hrgrop);
    debugPrint("Hrempgrop:"+Hrempgrop);
    debugPrint(check);
    debugPrint(GetEmp);
    if (check != '0' && GetEmp != "0") {
      await setpref(address, userlogin,passwordlogin);

      // Navigator.of(context).pushNamed('/main');
      // Navigator.pushReplacementNamed(context, '/First');
    } else {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Invalid Id or Password..',
              style: TextStyle(color: Colors.white))));
    }
    return("done....");
  }

  Future<dynamic> getDatainfo(String ip, String user0, String password0) async {
    try {
      var response = await http.get(
          "http://$ip/php_rest_myblog/api/data/dyn_sel.php?user=$user0&password=$password0&select=select%20org_id,decode(1,2,eorg_name,org_name)%20group_name%20from%20orgs%20where%20org_id%20in%20(select%20%20org_id%20from%20user_org%20where%20user_name%20=%20%27$user0%27)%20order%20by%20org_id");
      var res = await http.get(
          "http://$ip/php_rest_myblog/api/data/dyn_sel.php?user=$user0&password=$password0&select=select%20comp_code,decode(1,2,ecomp_name,comp_name)%20comp_name%20from%20company%20where%20comp_code%20in(select%20comp_code%20from%20user_comp%20where%20user_name=%27$user0%27%20and%20org_id=1)and%20org_id=1%20order%20by%20comp_code");
      var resp = await http.get(
          "http://$ip/php_rest_myblog/api/data/dyn_sel.php?user=$user0&password=$password0&select=select%20%20branch_code,decode(1,2,ebranch_name,branch_name)%20branch_name%20from%20branches%20where%20org_id=1%20and%20comp_code=1%20and%20branch_code%20in%20(select%20branch_code%20from%20user_branch%20where%20user_name=%27$user0%27%20and%20org_id=1%20and%20comp_code=1%20)order%20by%20branch_code");
      var year=await http.get(
          "http://$ip/php_rest_myblog/api/data/dyn_sel.php?user=$user0&password=$password0&select=select%20period_year%20from%20user_year%20where%20user_name='$user0'order%20by%20%20period_year");
     var loan=await http.get(
          "http://$ip/php_rest_myblog/api/data/dyn_sel.php?user=$user0&password=$password0&select=select%20loan_code,decode(1,2,eloan_name,loan_name)%20loan_name%20from%20hr_pay_loans%20where%20hr_group_code%20=%201%20order%20by%20loan_code");
      payload = payloadFromJson(response.body);
      payload2 = payloadFromJson(res.body);
      payload3 = payloadFromJson(resp.body);
      payload4=payloadFromJson(year.body);
      // payload5=payloadFromJson(loan.body);
      dropdownValue = payload.data[0];
      dropdownValue2 = payload2.data[0];
      dropdownValue3 = payload3.data[0];
      dropdownValue4 = payload4.data[0];
      notifyListeners();

    } catch (err) {
      debugPrint(err);
      throw err;
    }
  }
}


