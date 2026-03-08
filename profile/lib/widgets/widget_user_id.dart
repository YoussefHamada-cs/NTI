import 'package:flutter/material.dart';

class WidgetUserID extends StatelessWidget {
  const WidgetUserID({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},

      leading: Text('User ID'),
      title: Text('45687'),
      trailing: Icon(Icons.content_copy),
    );
  }
}
