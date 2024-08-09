import 'package:firebase_job_portal_poc/models/company_schema.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CompanyService {
  static const url = "https://jsonplaceholder.typicode.com/albums/1/photos";
  static Future<List<CompanySchema>> fetchCompanies() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<CompanySchema> companies = body
          .map(
            (dynamic item) => CompanySchema.fromJson(item),
          )
          .toList();
      return companies;
    } else {
      throw Exception('Failed to load companies');
    }
  }
}
