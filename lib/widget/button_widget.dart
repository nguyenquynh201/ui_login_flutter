import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final Size size;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final String title;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final bool loading;
  final bool enable;

  const ButtonWidget(
      {Key? key,
      required this.size,
      this.onPressed,
      this.padding = EdgeInsets.zero,
      required this.title,
      this.textStyle,
      this.backgroundColor,
      this.loading = false,
      this.enable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextButton(
        onPressed: (enable == true) ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            (loading)
                ? SizedBox(
                    child: CircularProgressIndicator(strokeWidth: 2.0),
                    height: 32,
                    width: 32)
                : Expanded(
                    child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      title,

                      style: GoogleFonts.inter(color: (enable == true) ? Colors.white : Colors.black,fontSize: 17).merge(textStyle),
                    ),
                  ))
          ],
        ),
        style: TextButton.styleFrom(
            backgroundColor: onPressed != null
                ? (backgroundColor ??
                    const Color(0xFF21899C)
                        .withOpacity((enable == true) ? 1.0 : 0.25))
                : Colors.grey,
            fixedSize: Size(double.infinity, size.height / 11),
            primary: Colors.black26,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
