import 'package:chat_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginOrSignUp extends StatelessWidget {
  final String text1;
  final String text2;
  void Function()? onTap;
  LoginOrSignUp(
      {required this.text1,
      required this.text2,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$text1 ",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey.shade700)),
          const SizedBox(width: 4),
          InkWell(
            onTap: onTap,
            child: Text(
              text2,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold, color: AppColor.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
