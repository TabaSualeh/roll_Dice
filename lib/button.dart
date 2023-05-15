import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btnName;
  final VoidCallback? callback;
  final double? fontsize;
  final bool? isEnabled;

  MyButton({
    required this.btnName,
    this.callback,
    this.fontsize = 25,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // onPressed: callback,
       onPressed: isEnabled! ? callback : null, 
      child: Text(btnName, style: TextStyle(fontSize: fontsize)),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(90, 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
