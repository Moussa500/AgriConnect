
// ignore_for_file: file_names, use_super_parameters

import 'package:flutter/material.dart';
import 'package:agriconnect/colors.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final bool obscure;
  final String? Function(String?) validate;
  final void Function(String?) save;
  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.obscure,
    required this.validate,
    required this.save,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final double devicewidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          obscureText: widget.obscure,
          validator: (value) {
            if (value == null) {
              return "This field is important";
            } else {
              return widget.validate(value);
            }
          },
          onSaved: widget.save,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide:BorderSide(color: primaryColor)
            ),
            hintText: widget.labelText,
            hintStyle: TextStyle(
              color: thirdColor,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
          
        ),
      ),
    );
  }
}
// ignore: must_be_immutable
class CustomField extends StatefulWidget {
  String label;
   CustomField({super.key,required this.label});

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    final double devicewidh = MediaQuery.of(context).size.width;
    return SizedBox(
      width: devicewidh * .9,
      child:  TextField(
        decoration: InputDecoration(
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