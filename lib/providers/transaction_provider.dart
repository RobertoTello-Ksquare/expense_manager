import 'package:expense_manager/model/transactions.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  List<Transactions> transactions = [];
num total = 0;
addtransaction(Transactions movement){
  transactions.add(movement);
  getAll(movement);
  notifyListeners();
}
getAll(Transactions movement){
movement.isExpense ? total -= movement.amount : total += movement.amount;
}
}