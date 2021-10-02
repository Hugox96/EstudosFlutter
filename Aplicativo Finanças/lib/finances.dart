import 'dart:convert';

import 'package:flutter/rendering.dart';

class Finance{
  List<Expense> eExpenses = [];
  List<Expense> nExpenses = [];
  List<Revenue> revenues = [];
  double balance = 0;
  double totalRevenue = 0;
  double totaleExpense = 0;
  double totalnExpense = 0;

  Finance._privateConstructor();

  static final Finance _instance = Finance._privateConstructor();

  factory Finance(){
    return _instance;
  }
  
  Finance.fromJson(Map<String, dynamic> json) {
    _instance.eExpenses = (json["eExpenses"] as List).map((eExp) => Expense.fromJson(eExp)).toList();
    _instance.nExpenses = (json["nExpenses"] as List).map((nExp) => Expense.fromJson(nExp)).toList();
    _instance.revenues = (json["revenues"] as List).map((rev) => Revenue.fromJson(rev)).toList();
    _instance.balance = json['balance'] as double;
    _instance.totalRevenue = json['totalRevenue'] as double;
    _instance.totaleExpense = json['totaleExpense'] as double;
    _instance.totalnExpense = json['totalnExpense'] as double;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['eExpenses'] = this.eExpenses;
    data['nExpenses'] = this.nExpenses;
    data['revenues'] = this.revenues;
    data['balance'] = this.balance;
    data['totalRevenue'] = this.totalRevenue;
    data['totaleExpense'] = this.totaleExpense;
    data['totalnExpense'] = this.totalnExpense;
    return data;
  }

  void addRevenue(double value){
    revenues.add(Revenue(value));
    print("Added $value to the revenue");
    updateBalance();
  }

  void addExpense(bool essential, String name, double value, date){
    if (essential){
      eExpenses.add(Expense(essential, name, value, date));
    }
    else{
      nExpenses.add(Expense(essential, name, value, date));
    }
    print("Added $value to the expense");
    updateBalance();
  }

  void removeRevenue(int index){
    revenues.removeAt(index);
    updateBalance();
  }

  void removeeExpense(int index){
    eExpenses.removeAt(index);
    updateBalance();
  }

   void removenExpense(int index){
    nExpenses.removeAt(index);
    updateBalance();
  }
  
  void updateBalance(){
    totalRevenue = 0;
    totaleExpense = 0;
    totalnExpense = 0;
    revenues.forEach((revenue) {
      totalRevenue += revenue.value;
    });
    eExpenses.forEach((expense) {
      totaleExpense += expense.value;
    });
    nExpenses.forEach((expense) {
      totalnExpense += expense.value;
    });
    balance = totalRevenue - totaleExpense - totalnExpense;
    print(balance);
  }
}

class Expense{
  bool essential;
  String name;
  double value;
  DateTime date;
  Expense(this.essential, this.name, this.value, this.date);

  factory Expense.fromJson(dynamic json){
    return Expense(
      json['essential'] as bool,
      json['name'] as String,
      json['value'] as double,
      DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['essential'] = this.essential;
    data['name'] = this.name;
    data['value'] = this.value;
    data['date'] = this.date.toIso8601String();
    return data;
  }

  @override
  String toString(){
    return "{ ${this.essential}, ${this.name}, ${this.value} , ${this.date}}";
  }
}

class Revenue{
  double value;

  Revenue(this.value);

  factory Revenue.fromJson(Map<String,dynamic> json){
    return Revenue(json['value'] as double);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }

  @override
  String toString(){
    return "{ ${this.value} }";
  }
}