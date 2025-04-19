import 'package:flutter/material.dart';

class MyButton2 extends StatelessWidget {
  const MyButton2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App 02"),
        backgroundColor: Colors.yellow,
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              print("Search Pressed");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("More Pressed");
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print("ElevatedButton Pressed");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text("ElevatedButton", style: TextStyle(fontSize: 18)),
            ),

            SizedBox(height: 20),

            OutlinedButton(
              onPressed: () {
                print("OutlinedButton Pressed");
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.red, width: 2),
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("OutlinedButton", style: TextStyle(fontSize: 18)),
            ),

            SizedBox(height: 50), // Đặt khoảng cách trước InkWell

            InkWell(
              onTap: () {
                print("InkWell được nhấn!");
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ),
                child: Text("Button tùy chỉnh với InkWell"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm kiếm"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá nhân"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Call Pressed");
        },
        child: Icon(Icons.add_ic_call),
      ),
    );
  }
}
