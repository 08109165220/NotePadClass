import 'package:flutter/material.dart';

import 'HomePage.dart';


class Todoinput extends StatelessWidget {
  const Todoinput({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomSheet: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, MaterialPageRoute(builder: (_) => Homepage()));
                  },
                    child: Icon(Icons.close)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
