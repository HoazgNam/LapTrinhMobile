import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    // Trả về Scaffold - widget cung cấp bố cục Material Design cơ bản
    return Scaffold(
      // Tiêu đề của ứng dụng
      appBar: AppBar(), // AppBar

      body: Center(
        child: Column(
          children: [
            // Tạo một khoảng cách
            const SizedBox(height: 50,),

            // Text cơ bản
            const Text("Luu Nam"),
            const SizedBox(height: 20,),

            const Text(
              "Xin chào các bạn đang học lập trình Flutter!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 20,),

            const Text(
              "Flutter là một SDK phát triển ứng dụng di động nguồn mở.",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                letterSpacing: 1.5,
              ), // TextStyle
            ), // Textyle
          ],
        ),
      ), // Column, Center
    ); // Scaffold
  }
}
