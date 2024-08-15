import 'dart:io';

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,

    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: Platform.isAndroid ? 16 : 0
      ),
      child: BottomAppBar(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60,
            color: Colors.deepOrangeAccent,
            child: Row(
              children: [
                navItem(Icons.note_sharp,
                  pageIndex == 0,
                  onTap: () => onTap(0),
                ),
                navItem(Icons.radio_button_on,
                  pageIndex == 1,
                  onTap: () => onTap(1),
                ),
              ],



            ),
          ),
        ),
      ),
    );
  }
}


Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
  return Expanded(child: InkWell(
    onTap: onTap,
    child: Icon(
        icon,
        color: selected ? Colors.white : Colors.deepOrangeAccent.withOpacity(
            0.4)
    ),
  ),);
}