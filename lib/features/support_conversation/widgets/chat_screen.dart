import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _showEmojiPicker = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              reverse: false, // Messages appear from bottom up
              children: <Widget>[
                _buildMessageBubble(
                  'مرحبا بك في shella',
                  isMe: false,
                  time: '1:00 ص',
                ),
                _buildMessageBubble(
                  'اهلا وسهلا',
                  isMe: true,
                  time: '1:00 ص',
                ),
              ],
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String message, {required bool isMe, required String time}) {
    return Row(
      mainAxisAlignment: isMe? MainAxisAlignment.end:MainAxisAlignment.start,
      children: [
        Align(
          alignment: isMe ? Alignment.centerLeft : Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 0, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 3), // Offset from the container
                ),
              ],
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(fontSize: 16),
                  textDirection: TextDirection.rtl, // Right-to-left text
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
        ),
        isMe?
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
              decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  shape: BoxShape.circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('M',style: TextStyle(color: AppColors.wtColor),
                ),
              )
          ),
        ):Container(),
      ],
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: CustomTextField(
              labelText: 'يرجى تقديم وصف موجز لمشكلتك',
              borderColor: AppColors.greenColor,
              padding: 10,
              horizontalPadding: 10,
            ),
          ),
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {
              // Handle attachment
            },
          ),
          IconButton(
            icon: Icon(Icons.emoji_emotions_outlined),
            onPressed: () {
              setState(() {
                _showEmojiPicker = !_showEmojiPicker;
              });
            },
          ),
        ],
      ),
    );
  }
}