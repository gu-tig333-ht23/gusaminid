import 'package:flutter/material.dart';

class SortingProvider extends ChangeNotifier {
  String _currentSorting = 'All';
  String get currentSorting => _currentSorting;

  void updateSorting(String newSorting) {
    _currentSorting = newSorting;
    notifyListeners();
  }
}
