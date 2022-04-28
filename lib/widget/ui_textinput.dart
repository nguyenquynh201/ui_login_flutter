import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef OnChange = Function(String);
typedef OnSubmit = Function(String);

class UITextInput extends StatelessWidget {
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final int? maxLength;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final VoidCallback? onRightIconPressed;
  final VoidCallback? onFocus;
  final OnChange? onChange;
  final OnSubmit? onSubmitted;
  final Size size;

  const UITextInput(
      {Key? key,
      this.hint,
      this.errorMessage,
      this.obscureText = false,
      this.maxLength,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.onRightIconPressed,
      this.onFocus,
      this.onChange,
      this.onSubmitted,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: (errorMessage == null || errorMessage!.isEmpty)
                      ? const Color(0xFFEFEFEF)
                      : Colors.red,
                  width: 1)),
          padding: const EdgeInsets.only(left: 16, right: 4),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: size.height / 11,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: TextField(
                    onTap: onFocus,
                    controller: controller,
                    onChanged: onChange,
                    onSubmitted: onSubmitted,
                    style: GoogleFonts.inter(fontSize: 14, height: 1.25),
                    textAlignVertical: TextAlignVertical.center,
                    obscureText: obscureText,
                    autocorrect: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hint,
                        hintStyle: GoogleFonts.inter(
                            fontSize: 12, color: const Color(0xFF969AA8))),
                  ),
                ),
              )),
              if (keyboardType == TextInputType.visiblePassword)
                Material(
                  color: const Color(0xFFEFEFEF),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: onRightIconPressed,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Icon((obscureText)
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                )
            ],
          ),
        ),
        if (!(errorMessage == null || errorMessage!.isEmpty))
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              errorMessage!,
              style: GoogleFonts.inter(color: Colors.red, fontSize: 13),
            ),
          ),
        if(errorMessage == null || errorMessage!.isEmpty)
          SizedBox(height: size.height / 20,)
      ],
    );
  }
}
