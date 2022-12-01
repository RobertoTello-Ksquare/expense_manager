import 'package:expense_manager/model/transactions.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  List<Transactions> transactions = [];
addtransaction(isIncome, title, amount, description, createdAt){
   Transactions transaction = Transactions(
      isIncome: isIncome,
      title: title,
      amount: amount,
      description: description,
      createdAt: createdAt,
    );
    transactions.add(transaction);
    notifyListeners();
  }
  
get getAll => transactions.length;
num total() {
    num total = 0;
    for (var i = 0; i < transactions.length; i++) {
      if (transactions[i].isIncome) {
        total += transactions[i].amount;
      } else {
        total -= transactions[i].amount;
      }
    }
    return total;
  }
}