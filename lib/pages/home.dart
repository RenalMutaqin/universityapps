import 'dart:convert';

import 'package:flutter/material.dart';
import '../widgets/summary_item.dart';
import 'package:http/http.dart' as http;
import '../models/Summary.dart';

class HomePage extends StatelessWidget {
  late Summary dataSummary;

  Future<void> getSummary() async {
    try {
      var response = await http
          .get(Uri.parse("http://universities.hipolabs.com/search?country"));

      if (response.statusCode == 200) {
        // Ubah ini sesuai dengan struktur data yang diterima dari API
        List<dynamic> responseData = jsonDecode(response.body);

        // Misalnya, kita ambil data pertama dari array
        if (responseData.isNotEmpty) {
          var data = responseData[0] as Map<String, dynamic>;
          dataSummary = Summary.fromJson(data);
        } else {
          print("Data kosong");
        }
      } else {
        print("Gagal mendapatkan data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Terjadi kesalahan: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Summary University Apps"),
        ),
        body: FutureBuilder(
            future: getSummary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("Loading"),
                );
              } else {
                return Column(
                  children: [
                    SummaryItem("University", "${dataSummary.name}"),
                    SummaryItem("Country", "${dataSummary.country}"),
                  ],
                );
              }
            })
        //
        // FutureBuilder(
        //   builder: (context, snapshot) {
        //     return Column(
        //       children: [
        //         SummaryItem("University", "Pasundan"),
        //         SummaryItem("Country", "Indonesia"),
        //       ],
        //     );
        //   }
        // )
        );
  }
}
