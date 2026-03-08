
import 'package:flutter/material.dart';

class WidgetInformation extends StatelessWidget {
  final String leading;
  final String title;
  final Function()? onTap;
  const WidgetInformation({
    super.key,
    required this.leading,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,

      leading: Text(leading),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
