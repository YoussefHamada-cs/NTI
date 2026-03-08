
import 'package:flutter/material.dart';

class CloseAccountButton extends StatelessWidget {
  const CloseAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Close Account',
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
      ),
    );
  }
}
