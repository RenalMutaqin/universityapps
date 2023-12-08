import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  SummaryItem(this.title, this.value);
  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.blue,
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
              Text(value,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
