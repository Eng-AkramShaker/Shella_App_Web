import 'package:flutter/foundation.dart';
import 'package:shella_design/features/my_points/domain/models/my_coupons_model.dart';
import 'package:shella_design/features/my_points/domain/models/transaction_model.dart';
import 'package:shella_design/features/my_points/domain/services/my_points_service_interface.dart';
import 'package:shella_design/features/my_points/domain/models/userinfo_model.dart';

class LoyaltyProvider with ChangeNotifier {
  final MyPointsServiceInterface _service;
  //final ProfileProvider _profileProvider;
  bool _converting = false;
  String? _error;

  LoyaltyProvider(
    this._service,
    // this._profileProvider
  );

  bool get isConverting => _converting;
  String? get error => _error;

  int _offset = 1;
  int get offset => _offset;
  List<String> _offsetList = [];
  List<Transaction>? _transactionList;
  List<Transaction>? get transactionList => _transactionList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int? _pageSize;
  int? get pageSize => _pageSize;
  User_Model? _user;
  User_Model? get user => _user;
  List<CouponModel> _coupons = [];
  List<CouponModel> get coupons => _coupons;
  int get couponsCount => _coupons.length;

  /// Clears any existing error and notifies listeners.
  void clearError() {
    if (_error != null) {
      _error = null;
      notifyListeners();
    }
  }

  Future<void> loadCoupons() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _coupons = await _service.getCouponsList();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadProfile() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await _service.fetchUserProfile();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void updatePoints(int newPoints) {
    if (_user != null) {
      _user = _user!.copyWith(loyaltyPoint: newPoints);
      notifyListeners();
    }
  }

// converting points to wallet
  Future<void> convertPoints(int points) async {
    _converting = true;
    _error = null;
    notifyListeners();

    try {
      await _service.convertPoints(points);
      await loadProfile();
    } catch (e) {
      _error = e.toString();
    } finally {
      _converting = false;
      notifyListeners();
    }
  }

  Future<void> getLoyaltyTransactionList(String offset, bool reload) async {
    if (offset == '1' || reload) {
      _offsetList = [];
      _offset = 1;
      _transactionList = null;
      if (reload) {
        notifyListeners();
      }
    }
    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);
      TransactionModel? transactionModel = await _service.getTransactions(offset);

      if (transactionModel != null) {
        if (offset == '1') {
          _transactionList = [];
        }
        _transactionList!.addAll(transactionModel.data!);
        _pageSize = transactionModel.totalSize;

        _isLoading = false;
        notifyListeners();
      }
    } else {
      if (isLoading) {
        _isLoading = false;
        notifyListeners();
      }
    }
  }

  void setOffset(int offset) {
    _offset = offset;
  }

  void showBottomLoader() {
    _isLoading = true;
    notifyListeners();
  }
}
