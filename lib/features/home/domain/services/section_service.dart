import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/features/home/domain/models/section_model.dart';
import 'package:shella_design/features/search_filter/domain/models/mostSearchedModel/most_searched_model.dart';

class SectionService {
  Future<List<SectionModel>> fetchCategories() async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'moduleId': '3',
      'Authorization':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMWM4NTc5M2I2ODJjMWJkOTUyM2M3NTg2Yzc2Y2ZmYzY3ZDgzMjJlN2Q2MTg0ODUzM2Y2MDQ0ODM0MTM4YWE2NmRlMTkyM2UzODYzZTBhNjYiLCJpYXQiOjE3NDY5ODEwNzkuMjAyNTQ2LCJuYmYiOjE3NDY5ODEwNzkuMjAyNTQ5LCJleHAiOjE3Nzg1MTcwNzkuMTk1MzQ1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.zPgBMHuEUV7bmsuKKZr4Rfzpb6DdsE3mp0-B4R4NnOAGhYAeU0jd_fCzlysfXX1L9VDppE-JQgVqe4TSKR1g8vzwhtQcGdKxJin6gO0werfVBCZNO1AqsDjtHzFx3sudqZSbnRamjPbEAUpDpcSV5vrMWXEGqgtO9qcPNQ_lrM0ED3Bto1P8XmUZlvpeIFnc9faS1Mt87P8dJ_ERxkgYQJbzEmAm0sr7s6DT6o5P_c__MqxSjPC-JIxb3xfXCJWjGNshm24mdJNrhxes4Uy8Cp6nUaLp073SfUHgYuO6wHG_QcY_YHzdkObEEAuGUz8YWP8QfuTFCGJIzTdQlkufrKTyhyDJlffT9nKEZXb1IT1DasrOgrTzwGIUL2AW2HJqjdrTf0Lfd5q9HwCpwRwHwNNY3Xx7SqS1E8dHtMrsdcu_Tqc1d6NC4XGjK97OjDtu1Z_Y8XKIsnmcl8poKT7UvFVSrIT0dy7IglXmlzNZcQnjZa5LTGdMWoJRKrJkl9rFi_M7SGKKPfo0pgtWdVa0J25YrEqUv3MB9-0lpuVNpYK3xu3lojbFzRpjtagCby_JKUorpnWc_QzIsGj8uL9ToziOBevdn_b7UNtsf3B99-XgAX2Do3XxMMCjwwEG-zeDGlE4hn-wk_vqmsfXkVNtOR8RpkIRr7dRHsz68smno1IE',
    };

    var request = http.Request(
      'GET',
      Uri.parse('${Api_Constants.appBaseUrl}/api/v1/categories'),
    );

    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);

      final List<dynamic> categoriesJson = data is List
          ? data
          : (data['categories'] ?? data['data'] ?? []) as List<dynamic>;

      return categoriesJson
          .map((e) => SectionModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to fetch categories: ${response.reasonPhrase}');
    }
  }


 Future<List<Module>> fetchModules() async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'moduleId': '3',
      'Authorization':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMWM4NTc5M2I2ODJjMWJkOTUyM2M3NTg2Yzc2Y2ZmYzY3ZDgzMjJlN2Q2MTg0ODUzM2Y2MDQ0ODM0MTM4YWE2NmRlMTkyM2UzODYzZTBhNjYiLCJpYXQiOjE3NDY5ODEwNzkuMjAyNTQ2LCJuYmYiOjE3NDY5ODEwNzkuMjAyNTQ5LCJleHAiOjE3Nzg1MTcwNzkuMTk1MzQ1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.zPgBMHuEUV7bmsuKKZr4Rfzpb6DdsE3mp0-B4R4NnOAGhYAeU0jd_fCzlysfXX1L9VDppE-JQgVqe4TSKR1g8vzwhtQcGdKxJin6gO0werfVBCZNO1AqsDjtHzFx3sudqZSbnRamjPbEAUpDpcSV5vrMWXEGqgtO9qcPNQ_lrM0ED3Bto1P8XmUZlvpeIFnc9faS1Mt87P8dJ_ERxkgYQJbzEmAm0sr7s6DT6o5P_c__MqxSjPC-JIxb3xfXCJWjGNshm24mdJNrhxes4Uy8Cp6nUaLp073SfUHgYuO6wHG_QcY_YHzdkObEEAuGUz8YWP8QfuTFCGJIzTdQlkufrKTyhyDJlffT9nKEZXb1IT1DasrOgrTzwGIUL2AW2HJqjdrTf0Lfd5q9HwCpwRwHwNNY3Xx7SqS1E8dHtMrsdcu_Tqc1d6NC4XGjK97OjDtu1Z_Y8XKIsnmcl8poKT7UvFVSrIT0dy7IglXmlzNZcQnjZa5LTGdMWoJRKrJkl9rFi_M7SGKKPfo0pgtWdVa0J25YrEqUv3MB9-0lpuVNpYK3xu3lojbFzRpjtagCby_JKUorpnWc_QzIsGj8uL9ToziOBevdn_b7UNtsf3B99-XgAX2Do3XxMMCjwwEG-zeDGlE4hn-wk_vqmsfXkVNtOR8RpkIRr7dRHsz68smno1IE',
    };

// hostes for api backend
    //  shalafood.net
    // shellafood.com
    var request = http.Request(
      'GET',
      Uri.parse('${Api_Constants.appBaseUrl}/api/v1/module'),
    );

    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final data = json.decode(responseBody);

      final List<dynamic> modulesJson = data ;
        

      return modulesJson
          .map((e) => Module.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to fetch modules: ${response.reasonPhrase}');
    }
  }

}
