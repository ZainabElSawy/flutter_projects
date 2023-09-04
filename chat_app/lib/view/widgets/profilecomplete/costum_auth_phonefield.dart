import 'package:chat_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// ignore: must_be_immutable
class CostumAuthPhoneField extends StatelessWidget {
  TextEditingController phone = TextEditingController();
  bool isFocused;
  void Function(bool)? onFocusChange;

  CostumAuthPhoneField(
      {required this.phone,
      required this.isFocused,
      required this.onFocusChange,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        border: Border.all(
            width: isFocused ? 2 : 1,
            color: isFocused ? AppColor.primaryColor : AppColor.grey),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Focus(
        onFocusChange: onFocusChange,
        child: Builder(
          builder: (context) {
            return InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                //print(number.phoneNumber);
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: const TextStyle(color: Colors.black),
              initialValue: PhoneNumber(isoCode: 'EG'),
              textFieldController: phone,
              formatInput: true,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              inputDecoration: const InputDecoration(
                border: InputBorder.none,
              ),
            );
          },
        ),
      ),
    );
  }
}
