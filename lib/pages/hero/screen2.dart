import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("ایران زیبا"),
      ),
      body: Center(
        child: Hero(
          tag: "Image0",
          child: Image.network("https://media.karnaval.ir/uploads/2022/07/4b059b1b-a559-4f02-bb2e-54df981c5905.jpg"),
        ),
      ),
    );
  }
}
