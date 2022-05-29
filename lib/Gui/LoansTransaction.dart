import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:view_selfservice/model/models.dart';
import 'package:http/http.dart' as http;
import 'package:view_selfservice/shared/Services.dart';

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));

String payloadToJson(Payload data) => json.encode(data.toJson());

// ignore: camel_case_types
class LoansTransaction extends StatefulWidget {
  @override
  _LoansTransactionState createState() => _LoansTransactionState();
}

// ignore: camel_case_types
class _LoansTransactionState extends State<LoansTransaction> {
  Payload payload;
  Payload payload2;
  Payload payload3;
  Datum dropdownValue;
  Datum dropdownValue2;
  Datum dropdownValue3;
  String ipaaddress;
  String userlogin;
  String passwordlogin;
  String hrgroup;
  String EmpID;
  dynamic i = 0;
  bool isInit = true;
  TextEditingController loan = TextEditingController();
  TextEditingController LOAN_VALUE = TextEditingController();
  TextEditingController FIRST_INST_DATE = TextEditingController();
  TextEditingController laondate = TextEditingController();
  TextEditingController LOAN_START_DATE = TextEditingController();
  TextEditingController order = TextEditingController();
  TextEditingController Inst_count = TextEditingController();
  TextEditingController Inst_value = TextEditingController();

  senddata() async {
    if (order.text != "") {
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      ipaaddress = prefs.getString("address");
      passwordlogin = prefs.getString("userlogin");
      userlogin = prefs.getString("passwordlogin");
      hrgroup = prefs.getString("Hrgrop");
      EmpID = prefs.getString("empID");

      Map loanreq = await loan_req_id();
      String loanReq = loanreq["data"][0]["loan_req_id"];
      Map sysdate = await getsysdate();
      String Sysdate = sysdate["data"][0]["sys"];
      debugPrint("loan_req_id" + loanReq + Sysdate);
      final msg = json.encode([
        {
          "loan_req_id": loanReq,
          "emp_id":EmpID,
          // dropdownValue2.emp_id,
          "hr_emp_group_code": hrgroup,
          "loan_id": dropdownValue.loan_id,
          "loan_start_date": LOAN_START_DATE.text,
          // "05-APR-22",
          "loan_value": LOAN_VALUE.text,
          "first_inst_date": FIRST_INST_DATE.text,
          // "06-APR-22",
          "payment_method": dropdownValue3.col_code,
          "inst_count": Inst_count.text,
          "inst_value": Inst_value.text,
          "created_user": userlogin,
          "created_date": Sysdate,
          "loan_req_code": order.text
        }
      ]);
      var url = Uri.parse(
          'http://$ipaaddress/php_rest_myblog/api/data/ins_tab.php?user=$userlogin&password=$passwordlogin&table=HR_PAY_EMP_LOANS_REQ');
      http.Response result = await http
          .post(url, body: msg, headers: {"content-type": "application/json"});

      if (result.statusCode == 200) {
        debugPrint("done" + result.body);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('<<<DataSaved>>>',
                style: TextStyle(color: Colors.white))));

        return Album.fromJson(jsonDecode(result.body));
      } else {
        throw Exception('Failed to create .');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
          Text('fill orderText', style: TextStyle(color: Colors.white))));
    }
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      getData().then((value) {

        setState(() {
          isInit = false;
        });
      });
    }
    super.didChangeDependencies();
  }

  Future<String> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ipaaddress = prefs.getString("address");
    userlogin = prefs.getString("userlogin");
    passwordlogin = prefs.getString("passwordlogin");

    hrgroup = prefs.getString("Hrgrop");

    print("share::" + hrgroup + userlogin + passwordlogin);
    try {
      var response = await http.get(
          "http://$ipaaddress/php_rest_myblog/api/data/dyn_sel.php?user=$userlogin&password=$passwordlogin&select=select%20loan_code,decode(1,2,eloan_name,loan_name)%20loan_name,loan_id%20from%20hr_pay_loans%20where%20hr_group_code%20=%20$hrgroup%20order%20by%20loan_code");
      // var empLov = await http.get(
      //     "http://$ipaaddress/php_rest_myblog/api/data/dyn_sel.php?user=$userlogin&password=$passwordlogin&select=select%20emp_code,decode(1,2,eemp_name,emp_name)%20emp_name,emp_id%20%20from%20hr_emp%20%20where%20hr_emp_group_code%20=$hrgroup%20and%20nvl(fired_flag,0)%20!=%201%20%20order%20by%20emp_code");
      var methodPayment = await http.get(
          "http://$ipaaddress/php_rest_myblog/api/data/dyn_sel.php?user=$userlogin&password=$passwordlogin&select=select%20ltrim(rtrim(col_code))%20col_code,decode(1,2,ecol_desc,col_desc)%20col_desc%20from%20system_codes%20where%20table_name%20=%20%27HR_PAY_EMP_LOANS_REQ%27%20and%20column_name%20=%20%27PAYMENT_METHOD%27%20and%20system_flag%20=%201");
      payload = payloadFromJson(response.body);
      // payload2 = payloadFromJson(empLov.body);
      payload3 = payloadFromJson(methodPayment.body);
      return 'success';
    } catch (err) {
      print(err);
      throw err;
    }
  }

  calculateInst_value() {
    if (dropdownValue3.col_code != '1') {
      double a = double.parse( LOAN_VALUE.text); //_one => TextEditingController of 1st TextField
      double b = double.parse( Inst_count.text); //_two => TextEditingController of 2nd TextField
      double c = a / b; //do your calculation
      Inst_value.text = c.toString();
    } else {
      Inst_value.text = Inst_count.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Loans Transaction Page'),
      ),
      body: isInit
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              enabled: false,
              controller: order,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)),
                labelText: 'رقم الطلب ',
                suffixIcon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),
            // Container(
            //   child: InputDecorator(
            //     decoration: InputDecoration(
            //       labelText: 'الموظف',
            //     ),
            //     child: DropdownButton<dynamic>(
            //       value: dropdownValue2,
            //       isExpanded: true,
            //       icon: Icon(Icons.check_circle_outline),
            //       iconSize: 10,
            //       // elevation: 15,
            //       style: TextStyle(color: Colors.deepPurple),
            //       underline: Container(
            //         height: 2,
            //         color: Colors.blue[300],
            //       ),
            //       onChanged: (newValue) {
            //         setState(() {
            //           dropdownValue2 = newValue;
            //           debugPrint(dropdownValue2.emp_code +
            //               "emp_id:" +
            //               dropdownValue2.emp_id);
            //         });
            //       },
            //       items:
            //           payload2.data.map<DropdownMenuItem<Datum>>((value) {
            //         return DropdownMenuItem<Datum>(
            //             value: value, child: Text(' ${value.emp_name}'));
            //       }).toList(),
            //     ),
            //   ),
            // ),
            Container(
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'السلفه',
                ),
                child: DropdownButton<dynamic>(
                  value: dropdownValue,
                  isExpanded: true,
                  icon: Icon(Icons.check_circle_outline),
                  iconSize: 10,
                  // elevation: 15,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.blue[300],
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      debugPrint(dropdownValue.loan_code +"loan_id:"+ dropdownValue.loan_id);
                    });
                  },
                  items:
                  payload.data.map<DropdownMenuItem<Datum>>((value) {
                    return DropdownMenuItem<Datum>(
                        value: value, child: Text(' ${value.loan_name}'));
                  }).toList(),
                ),
              ),
            ),
            TextField(
              onSubmitted: (s) async {
                Map periodyear = await getloan();
                String yearperiod =
                periodyear["data"][0]["loan_req_code"];
                order.text = yearperiod.toString();
                // i++;
                // order.text=i.toString();
              },
              controller: LOAN_START_DATE,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)),
                labelText: 'تاريخ بدايه السلفه ',
                suffixIcon: const Icon(
                  Icons.date_range_rounded,
                  color: Colors.black,
                ),
              ),
            ),
            TextField(
              controller: LOAN_VALUE,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)),
                labelText: 'مبلغ السلفه ',
                suffixIcon: const Icon(
                  Icons.money,
                  color: Colors.black,
                ),
              ),
            ),
            TextField(
              controller: FIRST_INST_DATE,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)),
                labelText: 'تاريخ اول قسط ',
                suffixIcon: const Icon(
                  Icons.date_range,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'نوع القسط',
                ),
                child: DropdownButton<dynamic>(
                  value: dropdownValue3,
                  isExpanded: true,
                  icon: Icon(Icons.check_circle_outline),
                  iconSize: 10,
                  // elevation: 15,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.blue[300],
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue3 = newValue;
                      debugPrint(dropdownValue3.col_code);
                    });
                  },
                  items:
                  payload3.data.map<DropdownMenuItem<Datum>>((value) {
                    return DropdownMenuItem<Datum>(
                        value: value, child: Text(' ${value.col_desc}'));
                  }).toList(),
                ),
              ),
            ),
            TextField(
              controller: Inst_count,
              onSubmitted: (s) {
                calculateInst_value();
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)),
                labelText: 'قيمة القسط/عدد الأقساط',
                suffixIcon: const Icon(
                  Icons.money_off,
                  color: Colors.black,
                ),
              ),
            ),
            TextField(
              controller: Inst_value,
              enabled: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)),
                labelText: 'قيمة القسط',
                suffixIcon: const Icon(
                  Icons.money_sharp,
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async =>
                // getyear()
                // getloan()
                senddata()
                //   ()async {
                // await  senddata();
                // log('data:$i');
                // } // ()=>{}
                ,
                child: Text("حفظ"))
          ],
        ),
      ),
    );
  }
}
