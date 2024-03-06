import "package:flutter/material.dart";

class EnrolledModel extends ChangeNotifier{
  int _count = 50;

  int get count => _count;

  void increment(){
    _count++;
    notifyListeners();
  }

  void decrement(){
    _count--;
    notifyListeners();
  }
}