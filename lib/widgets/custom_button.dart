
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool outlined ;
  final Function() onPressed;
  final IconData? icon;
  final String text ;
  const CustomButton({super.key, required this.outlined, required this.onPressed,  this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: outlined ?
          OutlinedButton(
            style: Theme.of(context).outlinedButtonTheme.style,
              onPressed: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon,size: 40,),
                  Text(text),
                ],
              ))
          : ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style,
          onPressed: onPressed,
          child: Text(text)),
    );
  }
}
