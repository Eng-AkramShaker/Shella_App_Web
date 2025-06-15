import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/textField/icon_textfield.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // رقم البطاقة
          const Text("رقم البطاقة", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Icon_TextField(hintText: "0000 0000 0000 44966 ", icon: Icons.credit_card, keyboardType: TextInputType.number),

          const SizedBox(height: 16),

          // تاريخ الانتهاء + رمز CVV في نفس السطر
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("تاريخ الانتهاء", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Icon_TextField(hintText: "MM/YY", icon: Icons.calendar_month, keyboardType: TextInputType.datetime),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("رمز CVV", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Icon_TextField(
                        hintText: "* * *", icon: Icons.error_outline, keyboardType: TextInputType.number, obscureText: true),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // الاسم
          const Text("الاسم", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Icon_TextField(hintText: "0000 0000 0000 44966 ", icon: Icons.person, keyboardType: TextInputType.name),
        ],
      ),
    );
  }
}
