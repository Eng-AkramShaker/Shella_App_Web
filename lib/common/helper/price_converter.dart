import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import 'package:shella_design/features/splash/controllers/splash_controller.dart';

class PriceConverter {
  static late SplashController _splash;

  static void init(BuildContext context) {
    _splash = Provider.of<SplashController>(context, listen: false);
  }

  static String convertPrice(double? price,
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
    bool isRightSide = _splash.configModel!.currencySymbolDirection == 'right';
    if (forTaxi && price! > 100000) {
      return '${isRightSide ? '' : '${_splash.configModel!.currencySymbol!} '}'
          '${intl.NumberFormat.compact().format(price)}'
          '${isRightSide ? ' ${_splash.configModel!.currencySymbol!}' : ''}';
    }

    return "$price";

    // return '${isRightSide ? '' : '${_splash.configModel!.currencySymbol!} '}'
    //     ' ${formatedStringPrice ?? toFixed(price!).toStringAsFixed(forDM ? 0 : _splash.configModel!.digitAfterDecimalPoint!).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}'
    //     ' ${isRightSide ? ' ${_splash.configModel!.currencySymbol!} ' : ''}';
  }

  static Widget convertAnimationPrice(double? price,
      {double? discount, String? discountType, bool forDM = false, TextStyle? textStyle}) {
    if (discount != null && discountType != null) {
      if (discountType == 'amount') {
        price = price! - discount;
      } else if (discountType == 'percent') {
        price = price! - ((discount / 100) * price);
      }
    }
    bool isRightSide = _splash.configModel!.currencySymbolDirection == 'right';
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AnimatedFlipCounter(
        duration: const Duration(milliseconds: 500),
        value: toFixed(price!, digits: 2),
        textStyle: textStyle ?? TextStyle(fontSize: 16, color: Colors.black),
        fractionDigits: forDM ? 0 : _splash.configModel!.digitAfterDecimalPoint!,
        prefix: isRightSide ? '' : '${_splash.configModel!.currencySymbol!} ',
        suffix: isRightSide ? '${_splash.configModel!.currencySymbol!} ' : '',
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

  static String percentageCalculation(String price, String discount, String discountType) {
    return '$discount${discountType == 'percent' ? '%' : _splash.configModel!.currencySymbol} OFF';
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
