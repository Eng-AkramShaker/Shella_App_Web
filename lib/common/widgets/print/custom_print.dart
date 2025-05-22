import 'package:flutter/foundation.dart';

customPrint(msg,{isError,isUrl}){
  if(isError==true){
    if (kDebugMode) {
      print('\x1B[31m$msg\x1B[0m');
    }
  }else if(isUrl==true){
    if (kDebugMode) {
      print('\x1B[34m$msg\x1B[0m');
    }
  }else{
    if (kDebugMode) {
      print('\x1B[38;5;13m$msg\x1B[0m');
    }
  }
}