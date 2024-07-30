import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: outLineBorder(),
        focusedBorder: outLineBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {}, 
          icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 30,
            ),
          )
      ),
    );
  }

  OutlineInputBorder outLineBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white
        ),
        borderRadius: BorderRadius.circular(12),
      );
  }
}