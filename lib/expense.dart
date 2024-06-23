// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

var x = Uuid();
final dateFormat = DateFormat.yMd();

enum Catigory { travil, food, clothes, rent }

const catigoryIcons = {
Catigory.food:Icons.launch,
Catigory.travil:Icons.travel_explore_outlined,
Catigory.clothes:Icons.share_arrival_time_outlined,
Catigory.rent:Icons.house_outlined,

};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Catigory catigory;
  String get formatedDate {
    return dateFormat.format(date);
  }

  Expense({
    required this.catigory,
    required this.title,
    required this.amount,
    required this.date,
  }) : id = x.v4();
}
