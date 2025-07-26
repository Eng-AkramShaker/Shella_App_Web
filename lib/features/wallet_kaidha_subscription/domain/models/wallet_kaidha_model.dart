// ignore_for_file: prefer_typing_uninitialized_variables

class WalletKaidhaModel {
  final Wallet? wallet;

  WalletKaidhaModel({this.wallet});

  factory WalletKaidhaModel.fromJson(Map<String, dynamic> json) {
    return WalletKaidhaModel(
      wallet: json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null,
    );
  }
}

class Wallet {
  final int id;
  final String serialNumber;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? completedAt;
  final int? completedBy;
  final String creditLimit;
  final String? minimumDue;
  final String availableBalance;
  final String usedBalance;
  final int usagePercentageLimit;
  final int autoLockDay;
  final String? manualUnlockExpiryDate;
  final int usagePercentageLimitByMonthly;
  final String? signaturePath;
  final int signatureStatus;
  final String? signatureDate;
  final String status;
  final int? couponId;
  final String? couponDiscountAmount;
  final String lockDay;
  final int minimumDueLimit;
  final int purchaseLimit;
  final int usedPercentage;
  final int totalAvilableBalance;

  Wallet({
    required this.id,
    required this.serialNumber,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.completedAt,
    this.completedBy,
    required this.creditLimit,
    this.minimumDue,
    required this.availableBalance,
    required this.usedBalance,
    required this.usagePercentageLimit,
    required this.autoLockDay,
    this.manualUnlockExpiryDate,
    required this.usagePercentageLimitByMonthly,
    this.signaturePath,
    required this.signatureStatus,
    this.signatureDate,
    required this.status,
    this.couponId,
    this.couponDiscountAmount,
    required this.lockDay,
    required this.minimumDueLimit,
    required this.purchaseLimit,
    required this.usedPercentage,
    required this.totalAvilableBalance,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      id: json['id'],
      serialNumber: json['serial_number'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      completedAt: json['completed_at'],
      completedBy: json['completed_by'],
      creditLimit: json['credit_limit'],
      minimumDue: json['minimum_due'],
      availableBalance: json['available_balance'],
      usedBalance: json['used_balance'],
      usagePercentageLimit: json['usage_percentage_limit'],
      autoLockDay: json['auto_lock_day'],
      manualUnlockExpiryDate: json['manual_unlock_expiry_date'],
      usagePercentageLimitByMonthly: json['usage_percentage_limit_by_monthly'],
      signaturePath: json['signature_path'],
      signatureStatus: json['signature_status'],
      signatureDate: json['signature_date'],
      status: json['status'],
      couponId: json['coupon_id'],
      couponDiscountAmount: json['coupon_discount_amount'],
      lockDay: json['lock_day'],
      minimumDueLimit: json['minimum_due_limit'],
      purchaseLimit: json['purchase_limit'],
      usedPercentage: json['used_percentage'],
      totalAvilableBalance: json['total_avilable_balance'],
    );
  }
}
