import 'package:flutter/material.dart';

/// الانتقال إلى شاشة جديدة باستخدام اسم المسار
void pushNewScreen(BuildContext context, String route, {dynamic arguments}) {
  Navigator.pushNamed(context, route, arguments: arguments);
}

/// الانتقال إلى شاشة جديدة مع إزالة جميع الشاشات السابقة
void pushAndRemoveUntil(BuildContext context, String route, {dynamic arguments}) {
  Navigator.pushNamedAndRemoveUntil(context, route, (Route<dynamic> route) => false, arguments: arguments);
}

/// استبدال الشاشة الحالية بشاشة جديدة
void pushReplacementNamedRoute(BuildContext context, String route, {dynamic arguments}) {
  Navigator.pushReplacementNamed(context, route, arguments: arguments);
}

/// إزالة جميع الشاشات السابقة والانتقال إلى شاشة جديدة
void removeAllNavigation(BuildContext context, String route, {dynamic arguments}) {
  Navigator.pushNamedAndRemoveUntil(context, route, (Route<dynamic> route) => false, arguments: arguments);
}

/// حذف جميع الشاشات السابقة من مكدس التنقل والانتقال إلى شاشة جديدة
void navigateAndDeleteAllBackStacks(BuildContext context, String route, {dynamic arguments}) {
  Navigator.pushNamedAndRemoveUntil(context, route, (Route<dynamic> route) => false, arguments: arguments);
}

/// الرجوع إلى الشاشة السابقة
void popRoute(BuildContext context) {
  Navigator.pop(context);
}
