import 'package:example/Widget/custom_card.dart';
import 'package:flutter/material.dart';

class ExpenseCardExample extends StatelessWidget {
  const ExpenseCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Cards')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ExpenseCard(
            date: '27 September 2024',
            type: 'E-Learning',
            totalExpense: 'PKR55',
          ),
          ExpenseCard(
            date: '18 September 2024',
            type: 'E-Learning',
            totalExpense: 'PKR55',
            approvalStatus: 'Approved',
            approvedBy: 'Elaine',
          
          ),
          ExpenseCard(
            date: '27 September 2024',
            type: 'Business Trip',
            totalExpense: 'PKR100',
            approvalStatus: 'Rejected',
            approvedBy: 'Elaine',
          ),
        ],
      ),
    );
  }
}
