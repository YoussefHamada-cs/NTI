
import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // ── اللون
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            spreadRadius: 1,
            offset: Offset(0, 3), // ── اتجاه الظل
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          collapsedBackgroundColor: Colors.white,
          backgroundColor: Color(
            0xFFF9F9F9,
          ), // ── لون مختلف وقت الفتح
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Tab",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          children: [
            ListTile(title: Text("Option 1"), onTap: () {}),
            ListTile(title: Text("Option 2"), onTap: () {}),
            ListTile(title: Text("Option 3"), onTap: () {}),
          ],
        ),
      ),
    );
  }
}
