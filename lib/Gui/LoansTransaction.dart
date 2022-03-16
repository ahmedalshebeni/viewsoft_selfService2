import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:view_selfservice/providers/test_provider.dart';

// ignore: camel_case_types
class LoansTransaction extends StatefulWidget {
  @override
  _LoansTransactionState createState() => _LoansTransactionState();
}

// ignore: camel_case_types
class _LoansTransactionState extends State<LoansTransaction> {
  Future<void> getin() async {}

  @override
  Widget build(BuildContext context) {
    return Consumer<TestProvider>(
      builder: (context, testProvider, child) =>
          Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: const Text('Loans Transaction Page'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    labelText: 'Emp Code',
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),

              ],
            ),
          )),
    );
  }
}
