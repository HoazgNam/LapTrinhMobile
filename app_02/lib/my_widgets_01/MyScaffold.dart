import 'package:flutter/material.dart';
class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // Trả về Scaffold - widget cung cấp bố cục Material Design cơ bản
    return Scaffold(
      // Màn hình có AppBar
      appBar: AppBar(
        title: Text("App 02"),
      ),
      backgroundColor: Colors.green,

      body: Center( child: Text("noi dung chinh"),),
      
      floatingActionButton: FloatingActionButton(onPressed: (){print("psessed");},
      child: const Icon(Icons.add_ic_call),),
      bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ",),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm kiếm",),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá nhân",
          ),
        ],
      ),
    );
  }
}

