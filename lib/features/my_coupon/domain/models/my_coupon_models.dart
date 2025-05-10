class Coupon {
  final int id;
  final String title;
  final double discount;
  final DateTime expiryDate;
  final bool isAvailable;

  Coupon({
    required this.id,
    required this.title,
    required this.discount,
    required this.expiryDate,
    required this.isAvailable,
  });
}