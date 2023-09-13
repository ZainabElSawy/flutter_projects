import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'searching now 🔍',
              style: TextStyle(fontSize: 22, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
