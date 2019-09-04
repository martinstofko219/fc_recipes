import 'package:flutter/material.dart';

class NavDrawerItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function() onTap;

  NavDrawerItem(
      {@required this.text, @required this.icon, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: Theme.of(context).textTheme.subhead,
      ),
      trailing: Icon(icon),
      onTap: onTap,
    );
  }
}
