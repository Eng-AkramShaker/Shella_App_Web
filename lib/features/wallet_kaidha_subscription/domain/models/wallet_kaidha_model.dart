// ignore_for_file: prefer_typing_uninitialized_variables

class WalletKaidhaModel {
  WalletKaidhaModel({
    required this.message,
    required this.wallet,
  });

  final String? message;
  final Wallet? wallet;

  factory WalletKaidhaModel.fromJson(Map<String, dynamic> json) {
    return WalletKaidhaModel(
      message: json["message"],
      wallet: json["wallet"] == null ? null : Wallet.fromJson(json["wallet"]),
    );
  }
}

class Wallet {
  Wallet({
    required this.id,
    required this.serialNumber,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.completedAt,
    required this.completedBy,
    required this.creditLimit,
    required this.minimumDue,
    required this.availableBalance,
    required this.usedBalance,
    required this.usagePercentageLimit,
    required this.status,
    required this.autoLockDay,
    required this.manualUnlockExpiryDate,
    required this.usagePercentageLimitByMonthly,
    required this.signaturePath,
    required this.signatureStatus,
    required this.lockDay,
    required this.minimumDueLimit,
    required this.purchaseLimit,
    required this.usedPercentage,
    required this.totalAvilableBalance,
  });

  var id;
  var serialNumber;
  var userId;
  var createdAt;
  var updatedAt;
  var completedAt;
  var completedBy;
  var creditLimit;
  var minimumDue;
  var availableBalance;
  var usedBalance;
  var usagePercentageLimit;
  var status;
  var autoLockDay;
  var manualUnlockExpiryDate;
  var usagePercentageLimitByMonthly;
  var signaturePath;
  var signatureStatus;
  var lockDay;
  var minimumDueLimit;
  var purchaseLimit;
  var usedPercentage;
  var totalAvilableBalance;

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      id: json["id"],
      serialNumber: json["serial_number"],
      userId: json["user_id"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      completedAt: json["completed_at"],
      completedBy: json["completed_by"],
      creditLimit: json["credit_limit"],
      minimumDue: json["minimum_due"],
      availableBalance: json["available_balance"],
      usedBalance: json["used_balance"],
      usagePercentageLimit: json["usage_percentage_limit"],
      status: json["status"],
      autoLockDay: json["auto_lock_day"],
      manualUnlockExpiryDate: json["manual_unlock_expiry_date"],
      usagePercentageLimitByMonthly: json["usage_percentage_limit_by_monthly"],
      signaturePath: json["signature_path"],
      signatureStatus: json["signature_status"],
      lockDay: json["lock_day"],
      minimumDueLimit: json["minimum_due_limit"],
      purchaseLimit: json["purchase_limit"],
      usedPercentage: json["used_percentage"],
      totalAvilableBalance: json["total_avilable_balance"],
    );
  }
}
