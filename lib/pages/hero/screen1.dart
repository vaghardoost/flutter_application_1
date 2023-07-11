import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/hero/screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = [
      "https://media.karnaval.ir/uploads/2022/07/4b059b1b-a559-4f02-bb2e-54df981c5905.jpg",
      "https://cdn.etemadonline.com/thumbnail/BIvI9gKyeSAA/ehElMRVuo0EFHFrusS9hOc_4F_1qGBmyn5Ym7JNXdnhXoExBHxP6d-y_2m57V24kgX9AT8TcCIo,/%D8%B4%D9%82%D8%A7%DB%8C%D9%82+%D9%84%D8%A7%D8%B1+%D8%AF%D9%85%D8%A7%D9%88%D9%86%D8%AF.jpg",
      "https://rahavardonline.com/wp-content/uploads/2021/05/1361221_123.jpeg",
      "https://www.raheeno.com/Uploadfiles/editor/tange-savashi-min.jpg",
      "https://www.raheeno.com/Uploadfiles/editor/katibeh-tangeh-vashi-min.jpg",
    ];
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Screen2(),
              ),
            );
          },
          child: Hero(
            tag: "Image$index",
            child: Image.network(
              list[index],
            ),
          ),
        ),
      ),
    );
  }
}
