import '/screens/order_placed_screen.dart';
import '/utils/size_utils.dart';
import 'package:flutter/material.dart';

class SettingMenuScreen extends StatelessWidget {
  const SettingMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.onPrimaryContainer,
              theme.colorScheme.primary,
            ],
          ),
        ),
        child: Padding(
          padding: getPadding(top: 111, left: 76),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Profile",
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(
                height: getVerticalSize(30),
              ),
              Text(
                "Shop",
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(
                height: getVerticalSize(30),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const OrderPlacedScreen()));
                },
                child: Text(
                  "My cart",
                  style: theme.textTheme.titleMedium,
                ),
              ),
              SizedBox(
                height: getVerticalSize(30),
              ),
              Text(
                "About Us",
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(
                height: getVerticalSize(30),
              ),
              Text(
                "Logout",
                style: theme.textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
