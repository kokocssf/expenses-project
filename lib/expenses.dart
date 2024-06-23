import 'package:flutter/material.dart';
import 'package:learn_dart/expense.dart';
import 'package:learn_dart/new_expense.dart';
import 'expanses/expenses_list.dart';
import 'expense.dart';

class expenses extends StatefulWidget {
  @override
  State<expenses> createState() => _expensesState();
}

class _expensesState extends State<expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
        catigory: Catigory.food,
        title: "eat in resturent",
        amount: 7.6,
        date: DateTime.now()),
    Expense(
        catigory: Catigory.rent,
        title: "renting in uka",
        amount: 799.6,
        date: DateTime.now()),
    Expense(
        catigory: Catigory.travil,
        title: "travile to amountin",
        amount: 79.6,
        date: DateTime.now())
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registerExpenses.remove(expense);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(80, 230, 228, 228),
          title: Text("the expenses"),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context, builder: (ctx) => NewExpense(onAddExpense: _addExpense,));
                },
                icon: Icon(Icons.add)),
          ],
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(child: ExpensesList(expenses: _registerExpenses, onRemoveExpense: _removeExpense,)),
          ]),
        ));
  }
}
