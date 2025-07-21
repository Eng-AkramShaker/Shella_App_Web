import 'package:flutter/material.dart';

class BalanceController with ChangeNotifier {
  final TextEditingController additionamount = TextEditingController();
  final TextEditingController transferamount = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final FocusNode amountFocusNode = FocusNode();
  String _selectedAmount = '';

  String get selectedAmount => _selectedAmount;

  transferController() {
    transferamount.addListener(_synctransferAmount);
  }

  void _synctransferAmount() {
    _selectedAmount = transferamount.text;
    notifyListeners();
  }

  void selecttransferAmount(String value) {
    final isOther = value == 'أخرى';

    if (_selectedAmount == value) {
      _selectedAmount = '';
      transferamount.clear();
    } else {
      _selectedAmount = value;
      if (!isOther) {
        transferamount.text = value;
      } else {
        transferamount.clear();
        Future.delayed(const Duration(milliseconds: 100), () {
          amountFocusNode.requestFocus();
        });
      }
    }
    notifyListeners();
  }

  addonController() {
    additionamount.addListener(_syncaddonAmount);
  }

  void _syncaddonAmount() {
    _selectedAmount = additionamount.text;
    notifyListeners();
  }

  void selectaddonAmount(String value) {
    final isOther = value == 'أخرى';

    if (_selectedAmount == value) {
      _selectedAmount = '';
      additionamount.clear();
    } else {
      _selectedAmount = value;
      if (!isOther) {
        additionamount.text = value;
      } else {
        additionamount.clear();
        Future.delayed(const Duration(milliseconds: 100), () {
          amountFocusNode.requestFocus();
        });
      }
    }
    notifyListeners();
  }

  @override
  void dispose() {
    phone.dispose();
    transferamount.dispose();
    additionamount.dispose();
    amountFocusNode.dispose();
    super.dispose();
  }
}
