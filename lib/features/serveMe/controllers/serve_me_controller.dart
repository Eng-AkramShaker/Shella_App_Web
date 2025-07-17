import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';

class ServeMeController extends ChangeNotifier {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController comments = TextEditingController();
  TextEditingController reviewcomments = TextEditingController();
  final FocusNode focusNode = FocusNode();
  String paymentMethod = "";

  void updatepaymentMethod(String newpaymentMethod) {
    paymentMethod = newpaymentMethod;
    notifyListeners();
  }

  @override
  void dispose() {
    comments.dispose();
    reviewcomments.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
