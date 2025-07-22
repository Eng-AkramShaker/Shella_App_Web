import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/features/splash/controllers/splash_controller.dart';

class PriceConverter {
  static String convertPrice(BuildContext context, double? price,
      {double? discount,
      String? discountType,
      bool forDM = false,
      bool isFoodVariation = false,
      String? formatedStringPrice,
      bool forTaxi = false}) {
    if (discount != null && discountType != null) {
      if (discountType == 'amount' && !isFoodVariation) {
        price = price! - discount;
      } else if (discountType == 'percent') {
        price = price! - ((discount / 100) * price);
      }
    }

    final splashCtrl = Provider.of<SplashController>(context, listen: false);
    bool isRightSide = splashCtrl.configModel?.currencySymbolDirection == 'right';
    String currencySymbol = splashCtrl.configModel?.currencySymbol ?? "ر.س";

    if (forTaxi && price! > 100000) {
      return '${isRightSide ? '' : ' '}${intl.NumberFormat.compact().format(price)}${isRightSide ? '  ' : ''}';
    }

    return isRightSide ? '${price!.toStringAsFixed(2)} $currencySymbol' : '$currencySymbol ${price!.toStringAsFixed(2)}';
  }

  static Widget convertPrice2(
    BuildContext context,
    double? price, {
    double? discount,
    String? discountType,
    TextStyle? textStyle,
    String? prefixText,
  }) {
    if (price == null) return const SizedBox();

    double discountedPrice = price;
    bool hasDiscount = false;

    if (discount != null && discountType != null) {
      if (discountType == 'amount') {
        discountedPrice = price - discount;
      } else if (discountType == 'percent') {
        discountedPrice = price - (discount / 100) * price;
      }
      hasDiscount = discountedPrice < price;
    }

    String formattedPrice = discountedPrice.toStringAsFixed(2);
    String originalPrice = price.toStringAsFixed(2);

    final splashCtrl = Provider.of<SplashController>(context, listen: false);
    String currencySymbol = splashCtrl.configModel?.currencySymbol ?? "ر.س";

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (prefixText != null) Text(prefixText, style: textStyle),
        if (hasDiscount) ...[
          Text(
            originalPrice,
            style: textStyle?.copyWith(
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(width: 5),
          Image.asset(AppImages.sar, width: 15, height: 15),
          const SizedBox(width: 5),
        ],
        Text(formattedPrice, style: textStyle),
        const SizedBox(width: 5),
        Image.asset(AppImages.sar, width: 15, height: 15),
      ],
    );
  }

  static Widget convertAnimationPrice(
    BuildContext context,
    double? price, {
    double? discount,
    String? discountType,
    bool forDM = false,
    TextStyle? textStyle,
  }) {
    if (discount != null && discountType != null) {
      if (discountType == 'amount') {
        price = price! - discount;
      } else if (discountType == 'percent') {
        price = price! - ((discount / 100) * price);
      }
    }

    final splashCtrl = Provider.of<SplashController>(context, listen: false);
    bool isRightSide = splashCtrl.configModel?.currencySymbolDirection == 'right';
    String currencySymbol = splashCtrl.configModel?.currencySymbol ?? "ر.س";
    int fractionDigits = splashCtrl.configModel?.digitAfterDecimalPoint ?? 2;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: AnimatedFlipCounter(
        duration: const Duration(milliseconds: 500),
        value: toFixed(price!, digits: 2),
        textStyle: textStyle,
        fractionDigits: forDM ? 0 : fractionDigits,
        prefix: isRightSide ? '' : '$currencySymbol ',
        suffix: isRightSide ? ' $currencySymbol' : '',
      ),
    );
  }

  static double? convertWithDiscount(double? price, double? discount, String? discountType, {bool isFoodVariation = false}) {
    if (price == null || discount == null || discountType == null) return null;

    if (discountType == 'amount' && !isFoodVariation) {
      price = price - discount;
    } else if (discountType == 'percent') {
      price = price - ((discount / 100) * price);
    }

    return price;
  }

  static double calculation(double amount, double? discount, String type, int quantity) {
    double calculatedAmount = 0;
    if (type == 'amount' || type == 'fixed') {
      calculatedAmount = discount! * quantity;
    } else if (type == 'percent') {
      calculatedAmount = (discount! / 100) * (amount * quantity);
    }
    return calculatedAmount;
  }

  static String percentageCalculation(BuildContext context, String price, String discount, String discountType) {
    final splashCtrl = Provider.of<SplashController>(context, listen: false);
    String currencySymbol = splashCtrl.configModel?.currencySymbol ?? "ر.س";
    return '$discount${discountType == 'percent' ? '%' : currencySymbol} OFF';
  }

  static double toFixed(double val, {int digits = 2}) {
    num mod = power(10, digits);
    return ((double.parse(val.toString()) * mod).floor().toDouble() / mod);
  }

  static int power(int x, int n) {
    int retval = 1;
    for (int i = 0; i < n; i++) {
      retval *= x;
    }
    return retval;
  }
}
