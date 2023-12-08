import 'dart:convert';

List<Summary> summaryFromJson(String str) =>
    List<Summary>.from(json.decode(str).map((x) => Summary.fromJson(x)));

String summaryToJson(List<Summary> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Summary {
  List<String> domains;
  String alphaTwoCode;
  String name;
  String country;
  String? stateProvince;
  List<String> webPages;

  Summary({
    required this.domains,
    required this.alphaTwoCode,
    required this.name,
    required this.country,
    required this.stateProvince,
    required this.webPages,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        domains: List<String>.from(json["domains"].map((x) => x)),
        alphaTwoCode: json["alpha_two_code"],
        name: json["name"],
        country: json["country"],
        stateProvince: json["state-province"],
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "domains": List<dynamic>.from(domains.map((x) => x)),
        "alpha_two_code": alphaTwoCode,
        "name": name,
        "country": country,
        "state-province": stateProvince,
        "web_pages": List<dynamic>.from(webPages.map((x) => x)),
      };
}
