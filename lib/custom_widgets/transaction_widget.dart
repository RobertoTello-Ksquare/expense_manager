import 'package:flutter/material.dart';
class TransactionWidget extends StatelessWidget {
  String title;
  num amount;
  bool isIncome;
  String createAt;
   TransactionWidget({Key? key,
    required this.title,
    required this.amount,
    required this.isIncome,
    required this.createAt,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(
                createAt,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          isIncome
              ? Text(
                  "+${amount.toString()}",
                  style: TextStyle(
                    color: Color(0xff56b38f),
                    fontSize: 18,
                  ),
                )
              : Text(
                  "-${amount.toString()}",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                )
        ],
      ),
    );
  }
}
