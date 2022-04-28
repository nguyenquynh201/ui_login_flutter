import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonSocialWidget extends StatelessWidget {
  final Size size;
  final String? iconPath;
  final String? text;
  final Color? color;
  final Color? colorText;
  const ButtonSocialWidget(
      {Key? key, required this.size, this.iconPath, this.text, this.color, this.colorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 13,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: color,
          border: Border.all(color: const Color(0xFF134140), width: 1.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(flex: 1, child: SvgPicture.asset(iconPath!)),
          Expanded(
              flex: 2,
              child: Text(
                text!,
                style: GoogleFonts.inter(
                    fontSize: 16, color: colorText),
              ))
        ],
      ),
    );
  }
}
