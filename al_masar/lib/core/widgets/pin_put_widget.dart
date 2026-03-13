import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinPutWidget extends StatelessWidget {
  const PinPutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);

    return Pinput(
      length: 6,
      separatorBuilder: (index) => const SizedBox(width: 8),
      validator: (value) {
        return value == '222222' ? null : 'Pin is incorrect';
      },
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: (pin) {
        debugPrint('onCompleted: $pin');
      },
      onChanged: (value) {
        debugPrint('onChanged: $value');
      },
      cursor: SizedBox.shrink(),
      focusedPinTheme: defaultPinTheme().copyBorderWith(
        border: Border.all(color: focusedBorderColor, width: 1.5),
      ),
      defaultPinTheme: defaultPinTheme(),
      submittedPinTheme: defaultPinTheme(),
      errorPinTheme: defaultPinTheme().copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    );
  }

  PinTheme defaultPinTheme() => PinTheme(
    width: 40,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
  );
}
