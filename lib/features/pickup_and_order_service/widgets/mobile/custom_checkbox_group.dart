import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

    
class CustomCheckboxGroup extends StatefulWidget {

  String title;
  List<String> options;


  CustomCheckboxGroup({ required this.title,required this.options  }) ;

  @override
  State<CustomCheckboxGroup> createState() => _CustomCheckboxGroupState();
}

class _CustomCheckboxGroupState extends State<CustomCheckboxGroup> {

      String? selectedAnswer;

      
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom_Text(context,text: widget.title,style: font16Black500W(context)),
          SizedBox(height: 10,),

          Column(
              children: widget.options.map((option) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedAnswer = option;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:  Colors.green ,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                            color: selectedAnswer == option 
                              ? Colors.green 
                              : Colors.transparent,
                          ),
                          child: selectedAnswer == option
                              ? const Icon(
                                  Icons.check,
                                  size: 14,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                       SizedBox(width: 5.w,) ,
                        // Option text
               Custom_Text(context,text: option,style: font14Black500W(context)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            Divider()
    
        ],
      ),
     
    );
  }
}