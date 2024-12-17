import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;  // Title for the AppBar
  final IconData leadingIcon;  // Leading icon for navigation
  final VoidCallback onLeadingIconPressed;  // Action when the leading icon is pressed

  // Constructor
  CustomAppBar({
    required this.title,
    required this.leadingIcon,
    required this.onLeadingIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,  // Set background color to green
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,  // Title text color
        ),
      ),
      leading: IconButton(
        icon: Icon(leadingIcon),
        color: Colors.white,  // Icon color
        onPressed: onLeadingIconPressed,  // Navigate or perform any action
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);  // Standard AppBar height
}
