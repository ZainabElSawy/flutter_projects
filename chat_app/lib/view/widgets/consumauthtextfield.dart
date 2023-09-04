import 'package:flutter/material.dart';

import '../../core/constant/colors.dart';

// ignore: must_be_immutable
class ConsumAuthTextForm extends StatelessWidget {
  TextEditingController? ctr = TextEditingController();
  final String hintText;
  final String labelText;
  final IconData icon;
  final bool? isShowPass;
  String? Function(String?)? valid;
  void Function()? onPressedIcon;
  ConsumAuthTextForm({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.ctr,
    required this.icon,
    this.isShowPass,
    this.onPressedIcon,
    this.valid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: labelText == "Email" ? TextInputType.emailAddress : null,
        obscureText: isShowPass == null || isShowPass == false ? false : true,
        validator: valid,
        controller: ctr,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: onPressedIcon,
            icon: Icon(icon),
            color: AppColor.grey,
          ),
          hintText: hintText,
          label: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              labelText,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          floatingLabelStyle: const TextStyle(color: AppColor.primaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey.shade400,
            ),
            borderRadius: BorderRadius.circular(28),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: AppColor.primaryColor,
            ),
            borderRadius: BorderRadius.circular(28),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey.shade400,
            ),
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ),
    );
  }
}
