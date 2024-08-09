// To parse this JSON data, do
//
//     final companySchema = companySchemaFromJson(jsonString);

import 'dart:convert';

List<CompanySchema> companySchemaFromJson(String str) => List<CompanySchema>.from(json.decode(str).map((x) => CompanySchema.fromJson(x)));

String companySchemaToJson(List<CompanySchema> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompanySchema {
    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    CompanySchema({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    factory CompanySchema.fromJson(Map<String, dynamic> json) => CompanySchema(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
