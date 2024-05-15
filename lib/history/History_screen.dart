import 'package:flutter/material.dart';


class HistoryScreen extends StatelessWidget {
  static String routeName = "/HistoryScreen";
  // Mock data for bank transactions
  final List<BankTransaction> transactions = [
    BankTransaction(
      date: 'May 10, 2024',
      description: 'Salary',
      amount: 5000.0,
      type: TransactionType.credit,
    ),
    BankTransaction(
      date: 'May 9, 2024',
      description: 'Shopping',
      amount: -200.0,
      type: TransactionType.debit,
    ),
    // Add more transactions here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Transaction History'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return ListTile(
            leading: Icon(
              transaction.type == TransactionType.credit
                  ? Icons.arrow_upward
                  : Icons.arrow_downward,
              color: transaction.type == TransactionType.credit
                  ? Colors.green
                  : Colors.red,
            ),
            title: Text(transaction.description),
            subtitle: Text(transaction.date),
            trailing: Text(
              '\$${transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                color: transaction.type == TransactionType.credit
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}

// Enum to represent transaction type (credit or debit)
enum TransactionType { credit, debit }

// Model class for bank transaction
class BankTransaction {
  final String date;
  final String description;
  final double amount;
  final TransactionType type;

  BankTransaction({
    required this.date,
    required this.description,
    required this.amount,
    required this.type,
  });
}