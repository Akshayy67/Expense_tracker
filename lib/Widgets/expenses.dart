import 'package:expense_tracker/Widgets/Expenses_list/expense_list.dart';
import 'package:expense_tracker/Widgets/charts/chart.dart';
import 'package:expense_tracker/Widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredItems = [];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (cxt) => NewExpense(addExpense),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      _registeredItems.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    var index = _registeredItems.indexOf(expense);
    setState(() {
      _registeredItems.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(
              () {
                _registeredItems.insert(index, expense);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found ,Try adding some!'),
    );
    if (_registeredItems.isNotEmpty) {
      mainContent = ExpenseList(expenses: _registeredItems, removeExpense);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredItems),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
