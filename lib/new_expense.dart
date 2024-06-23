import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learn_dart/expense.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final formatter = DateFormat.yMd();
  DateTime? _selectedDate;
  Catigory _selectedCatigory = Catigory.travil;
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Amount"), prefixText: "\$"),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? "no date Select date"
                        : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: () async {
                          final now = DateTime.now();
                          final firstDate =
                              DateTime(now.year - 1, now.month, now.day);
                          final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: now,
                              firstDate: firstDate,
                              lastDate: now);
                          setState(() {
                            _selectedDate = pickedDate;
                          });
                        },
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCatigory,
                items: Catigory.values
                    .map((e) => DropdownMenuItem(
                        value: e, child: Text(e.name.toUpperCase())))
                    .toList(),
                onChanged: (newcat) {
                  if (newcat == null) {
                    return;
                  }

                  setState(() {
                    _selectedCatigory = newcat;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("cancel"),
              ),
              ElevatedButton(
                  onPressed: () {
                    final enteredAmount =
                        double.tryParse(_amountController.text);
                    final amountIsInvalid =
                        enteredAmount == null || enteredAmount <= 0;

                    if (_titleController.text.trim().isEmpty ||
                        amountIsInvalid ||
                        _selectedCatigory == null) {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("error"),
                          content: Text("the app should have input"),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: Text("ok"))
                          ],
                        ),
                      );
                    }
                    widget.onAddExpense(Expense(
                        catigory: _selectedCatigory,
                        title: _titleController.text,
                        amount: enteredAmount!,
                        date: _selectedDate!));
                    Navigator.pop(context);
                  },
                  child: const Text("save expese"))
            ],
          )
        ],
      ),
    );
  }
}
