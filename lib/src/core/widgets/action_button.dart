import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String result) {
        if (result == 'Categories') {
          // Handle Option 1
        } else if (result == 'Highlights') {
          // Handle Option 2
        } else if (result == 'Profile') {
          // Handle Option 3
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Categories',
          child: Text('Categories'),
        ),
        const PopupMenuItem<String>(
          value: 'Highlights',
          child: Text('Highlights'),
        ),
        const PopupMenuItem<String>(
          value: 'Profile',
          child: Text('Profile'),
        ),
      ],
    );
  }
}
