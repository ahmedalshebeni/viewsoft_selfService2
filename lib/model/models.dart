import 'package:flutter/material.dart';

class Payload {
  List<Datum> data;

  Payload({
    this.data,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  // ignore: non_constant_identifier_names
  String stk_id;
  // ignore: non_constant_identifier_names
  String org_id;
  // ignore: non_constant_identifier_names
  String group_name;
  // ignore: non_constant_identifier_names
  String shift_id;
  // ignore: non_constant_identifier_names
  String shift_name;
  // ignore: non_constant_identifier_names
  String branch_code;
  // ignore: non_constant_identifier_names
  String branch_name;
  // ignore: non_constant_identifier_names
  String period_year;

  // ignore: non_constant_identifier_names
  String stk_name;
  // ignore: non_constant_identifier_names
  String sal_tr_type_id;
  // ignore: non_constant_identifier_names
  String sal_tr_type_name;
  // ignore: non_constant_identifier_names
  String curr_code;
  // ignore: non_constant_identifier_names
  String curr_name;
  // ignore: non_constant_identifier_names
  String comp_code;
  // ignore: non_constant_identifier_names
  String comp_name;
  // ignore: non_constant_identifier_names
  String loan_code;
  String col_code;
  String col_desc;
  String emp_code;
  String emp_id;
  // ignore: non_constant_identifier_names
  String loan_name;
  String emp_name;
  String loan_id;

  Datum({
    // ignore: non_constant_identifier_names
    this.stk_id,
    // ignore: non_constant_identifier_names
    this.stk_name,
    // ignore: non_constant_identifier_names
    this.sal_tr_type_id,
    // ignore: non_constant_identifier_names
    this.sal_tr_type_name,
    // ignore: non_constant_identifier_names
    this.curr_code,
    // ignore: non_constant_identifier_names
    this.curr_name,
    // ignore: non_constant_identifier_names
    this.shift_id,
    // ignore: non_constant_identifier_names
    this.shift_name,
    // ignore: non_constant_identifier_names
    this.org_id,
    // ignore: non_constant_identifier_names
    this.group_name,
    // ignore: non_constant_identifier_names
    this.comp_code,
    // ignore: non_constant_identifier_names
    this.comp_name,
    // ignore: non_constant_identifier_names
    this.branch_code,
    // ignore: non_constant_identifier_names
    this.branch_name,
    // ignore: non_constant_identifier_names
    this.period_year,
    // ignore: non_constant_identifier_names
    this.loan_code,
    this.loan_id,
    // ignore: non_constant_identifier_names
    this.loan_name,
    this.emp_name,
    this.emp_code,
    this.emp_id,
    this.col_code,
    this.col_desc,

  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
      stk_name:json["stk_name"],
      stk_id:json["stk_id"],
      sal_tr_type_id:json["sal_tr_type_id"],
      sal_tr_type_name: json["sal_tr_type_name"],
      curr_code: json ["curr_code"],
      curr_name: json ["curr_name"],
      shift_id: json ["shift_id"],
      shift_name: json ["shift_name"],
      group_name:json ["group_name"],
      org_id:json ["org_id"],
      comp_name:json["comp_name"],
      comp_code:json["comp_code"],
      branch_code:json["branch_code"],
      branch_name: json["branch_name"],
      period_year:json["period_year"],
      loan_code:json["loan_code"],
      loan_name:json["loan_name"],
      emp_code:json["emp_code"],
      emp_name:json["emp_name"],
      emp_id:json["emp_id"],
    col_code:json["col_code"],
    col_desc:json["col_desc"],
    loan_id:json["loan_id"],
  );

  Map<String, dynamic> toJson() => {
    "stk_id":"$stk_id",
    "loan_code":"$loan_code",
    "stk_name":"$stk_name",
    "loan_name":"$loan_name",
    "sal_tr_type_id":"$sal_tr_type_id",
    "sal_tr_type_name":"$sal_tr_type_name",
    "curr_code":"$curr_code",
    "curr_name" : "$curr_name",
    "shift_id":"$shift_id",
    "shift_name" : "$shift_name",
    "org_id":"$org_id",
    "group_name":"$group_name",
    "comp_code":"$comp_code",
    "comp_name":"$comp_name",
    "branch_name":"$branch_name",
    "branch_code":"$branch_name",
    "period_year":"$period_year",
    "emp_code":"$emp_code",
    "emp_name":"$emp_name",
    "emp_id":"$emp_id",
    "col_code":"$col_code",
    "col_desc":"$col_desc",
    "loan_id":"$loan_id",

  };
}

class Album {
  // ignore: non_constant_identifier_names
  final int loan_req_id;
  final int loan_req_code;
  final int emp_id;
  final int hr_emp_group_code;
  final int loan_id;
  final String loan_start_date;
  final String title;

  // ignore: non_constant_identifier_names
  final int loan_value;
  // ignore: non_constant_identifier_names
  final String first_inst_date;
  // ignore: non_constant_identifier_names
  final int payment_method;
  // ignore: non_constant_identifier_names
  final int inst_count;
  // ignore: non_constant_identifier_names
  final int inst_value;
  final String created_user;
  final String created_date;
  // ignore: non_constant_identifier_names

  Album(
      // ignore: non_constant_identifier_names
          {
        this.loan_req_id,
        this.loan_req_code,
        this.emp_id,
        // ignore: non_constant_identifier_names
        this.hr_emp_group_code,
        // ignore: non_constant_identifier_names
        this.loan_id,
        // ignore: non_constant_identifier_names
        this.loan_start_date,
        // ignore: non_constant_identifier_names
        this.loan_value,
        // ignore: non_constant_identifier_names
        this.first_inst_date,
        this.payment_method,
        this.inst_count,
        this.inst_value,
        this.created_user,
        // ignore: non_constant_identifier_names
        this.created_date,
        this.title,
      }
      );

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      loan_req_id: json['loan_req_id'],
      loan_req_code: json['loan_req_code'],
      emp_id: json['emp_id'],
      hr_emp_group_code: json['hr_emp_group_code'],
      loan_id: json['loan_id'],
      loan_start_date: json['loan_start_date'],
      loan_value: json['loan_value'],
      first_inst_date: json['first_inst_date'],
      payment_method: json['payment_method'],
      inst_count: json['inst_count'],
      inst_value:json['inst_value'],
      created_user:json['created_user'],
      created_date:json['created_date'],
        title:json['title'],
    );
  }
}

// class Product {
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       emp_id:json['emp_id']??'0',
//       work_date: json['work_date']??'0',
//       work_type: json['work_type']??'0',
//       start_time: json['start_time']??'0',
//       end_time: json['end_time']??"0",
//       shift_id: json['shift_id']??'0',
//       created_user:json['created_user']??'0',
//       created_date: json['created_date']??'0',
//       changed_user:json['changed_user']??'0',
//       changed_date: json['changed_date']??'0',
//       // wfl_approve_flag: json['wfl_approve_flag']??"",shift_id
//     );
//   }
//   Product(
//       {
//         // ignore: non_constant_identifier_names
//         this.emp_id,
//         // ignore: non_constant_identifier_names
//         this.work_date,
//         // ignore: non_constant_identifier_names
//         this.work_type,
//         // ignore: non_constant_identifier_names
//         this.start_time,
//         // ignore: non_constant_identifier_names
//         this.end_time,
//         // ignore: non_constant_identifier_names
//         this.shift_id,
//         // ignore: non_constant_identifier_names
//         this.created_user,
//         // ignore: non_constant_identifier_names
//         this.created_date,
//         // ignore: non_constant_identifier_names
//         this.changed_user,
//         // ignore: non_constant_identifier_names
//         this.changed_date,
//       });
//   // ignore: non_constant_identifier_names
//   final String emp_id;
//   // ignore: non_constant_identifier_names
//   final String work_date;
//   // ignore: non_constant_identifier_names
//   final String work_type;
//   // ignore: non_constant_identifier_names
//   final String start_time;
//   // ignore: non_constant_identifier_names
//   final String end_time;
//   // ignore: non_constant_identifier_names
//   final String shift_id;
//   // ignore: non_constant_identifier_names
//   final String created_user;
//   // ignore: non_constant_identifier_names
//   final String created_date;
//   // ignore: non_constant_identifier_names
//   final String changed_user;
//   // ignore: non_constant_identifier_names
//   final String changed_date;
//
// }


