
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_manager/providers/transaction_provider.dart';

class Balance extends StatefulWidget {
  const Balance({super.key});

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  @override
  Widget build(BuildContext context) {
       return SafeArea(
        child:Scaffold(
          backgroundColor: Color.fromARGB(255, 117, 199, 148),
          body: Column(
            children: [
              Container(
                height: 400,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('BALANCE', style: TextStyle(fontSize: 24,color: Colors.white),),
                    Text('\$USD',
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600,color: Colors.white),),
                    SizedBox(
                      height: 50,
                      width: 130,
                      child: ElevatedButton(onPressed: (){
                        //Navigator.push(context,)
                      },style: ElevatedButton.styleFrom(backgroundColor: Colors.white), 
                      child: Text(
                        'Create', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 117, 199, 148)),)),
                    ),
                    ],
                  )),
              ),Expanded(child: Provider.of<TransactionProvider>(context,listen: false).transactions.isEmpty
              ? Center(
                child: Text('No Data Found', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
              )):
            ],
          ),
      )
    );
  }
}

  