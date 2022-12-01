import 'package:expense_manager/custom_widgets/transaction_widget.dart';
import 'package:expense_manager/model/transactions.dart';
import 'package:expense_manager/screens/submit.dart';
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
        child: Scaffold(
      backgroundColor: Color(0xff56b38f),
      body: Column(
        children: [
          Container(
            height: 400,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'BALANCE',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Text(
                    '\$ ${Provider.of<TransactionProvider>(context, listen: true).total()} USD',
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                  width: 130,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Movements()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      child: Text(
                        'Create',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff56b38f)),
                      )),
                ),
              ],
            )),
          ),
          Expanded(child:
              Consumer<TransactionProvider>(builder: (context, obj, child) {
            List<Transactions> transactions = obj.transactions;
            if (transactions.isEmpty) {
              return const Center(
                child: Text('No Data Found'),
              );
            } else {
              return ListView.builder(
                itemCount: transactions.length,
                itemBuilder: ((context, index) {
                  Transactions transaction = transactions[index];
                  return TransactionWidget(
                      
                          title: transaction.title,
                          amount: transaction.amount,
                          isIncome: transaction.isIncome,
                          createAt: transaction.createdAt,
                      );
                }),
              );
            }
          }))
        ],
      ),
    ));
  }
}
