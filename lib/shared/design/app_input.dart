import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final String text;
  final double paddingBottom;
  final bool isPassword;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final Function(String)? onChange;

  const AppInput(
      {super.key,
      required this.text,
      this.paddingBottom = 16,
      this.isPassword = false,
        this.validator,
        this.controller, this.onChange
      });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.paddingBottom),
      child: TextFormField(
        obscureText: isPasswordHidden && widget.isPassword,
        validator: widget.validator,
        controller: widget.controller,
        onChanged: widget.onChange,
        decoration: InputDecoration(
          labelText: widget.text,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    isPasswordHidden = !isPasswordHidden;
                    setState(() {});
                  },
                  icon: isPasswordHidden
                      ? const Icon(
                          Icons.visibility_off,
                        )
                      : const Icon(
                          Icons.visibility,
                        ),
                )
              : null,
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: .5),
          ),
        ),
      ),
    );
  }
}
