import 'package:agriconnect/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  Function()? onPressed;
  CustomButton({super.key, required this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final double devicewidh = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: devicewidh * .8,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: thirdColor),
          borderRadius: BorderRadius.circular(17),
        ),
        child: const Center(
          child: Text(
            "start",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
// ignore: must_be_immutable
class SearchField extends StatefulWidget {
  String label;
   SearchField({super.key,required this.label});

  @override
  State<SearchField> createState() => _SearchFieldState();
}
class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    final double devicewidh = MediaQuery.of(context).size.width;
    return SizedBox(
      width: devicewidh * .9,
      child:  TextField(
        decoration: InputDecoration(
          prefixIcon:const  Icon(Icons.search),
          border:const  OutlineInputBorder(
            borderRadius:  BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: widget.label,
          hintStyle: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
