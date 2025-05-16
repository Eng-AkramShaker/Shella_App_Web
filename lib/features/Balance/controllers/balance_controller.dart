import 'package:flutter/material.dart';
import 'package:shella_design/common/models/response_model.dart';
import 'package:shella_design/features/Balance/domain/services/balance_service_interface.dart';

enum BalanceState { initial, loading, success, error }

class BalanceController with ChangeNotifier {
  final TextEditingController additionamount = TextEditingController();
  final TextEditingController transferamount = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final FocusNode amountFocusNode = FocusNode();
  String _selectedAmount = '';
  final BalanceServiceInterface? balanceServiceInterface;

  BalanceState _state = BalanceState.initial;
  BalanceState get state => _state;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  BalanceController({this.balanceServiceInterface}) {
    // Initialize controllers when constructed
    addonController();
    transferController();
  }

  String get selectedAmount => _selectedAmount;

  Future<ResponseModel> addFund() async {
    _setState(BalanceState.loading);

    try {
      if (balanceServiceInterface == null) {
        _setError('Service not initialized');
        return ResponseModel(false, 'Service not initialized');
      }

      final responseModel = await balanceServiceInterface!.addFund(
        amount: additionamount.text,
        paymentMethod: "100", // Hard-coded as per the requirements
      );

      if (responseModel.isSuccess) {
        _setState(BalanceState.success);
      } else {
        _setError(responseModel.message ?? 'Unknown error');
      }

      return responseModel;
    } catch (e) {
      _setError(e.toString());
      return ResponseModel(false, e.toString());
    }
  }

  // Private helper methods to reduce code duplication
  void _setState(BalanceState newState) {
    _state = newState;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    _setState(BalanceState.error);
  }

  void transferController() {
    transferamount.addListener(_synctransferAmount);
  }

  void _synctransferAmount() {
    _selectedAmount = transferamount.text;
    notifyListeners();
  }

  void selecttransferAmount(String value) {
    final isOther = value == 'أخرى';
    final isSameValue = _selectedAmount == value;

    if (isSameValue) {
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

  void addonController() {
    additionamount.addListener(_syncaddonAmount);
  }

  void _syncaddonAmount() {
    _selectedAmount = additionamount.text;
    notifyListeners();
  }

  void selectaddonAmount(String value) {
    final isOther = value == 'أخرى';
    final isSameValue = _selectedAmount == value;

    if (isSameValue) {
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

  void resetState() {
    _state = BalanceState.initial;
    _errorMessage = null;
    notifyListeners();
  }

  @override
  void dispose() {
    // Clean up controllers and focus nodes
    phone.dispose();
    transferamount.removeListener(_synctransferAmount);
    transferamount.dispose();
    additionamount.removeListener(_syncaddonAmount);
    additionamount.dispose();
    amountFocusNode.dispose();
    super.dispose();
  }
}
