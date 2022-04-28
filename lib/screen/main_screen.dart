import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/screen/login_screen_four.dart';
import 'package:login_ui/screen/login_screen_three.dart';
import 'package:login_ui/screen/login_screen_two.dart';

import 'login_screen_one.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            children: [
              logo(100, 100),
              richText(16),
              SizedBox(height: 10),
              buildButton(
                  'Design 1',
                  context,
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const LoginScreenOne()))), buildButton(
                  'Design 2',
                  context,
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const LoginScreenTwo()))),
              buildButton(
                  'Design 3',
                  context,
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const LoginScreenThree()))),  buildButton(
                  'Design 4',
                  context,
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const LoginScreenFour()))),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo(double height_, double width_) {
    return SvgPicture.asset('assets/logo.svg', width: width_, height: height_);
  }

  Widget richText(double fontSize) {
    return Text.rich(
      TextSpan(
          style: GoogleFonts.inter(
              fontSize: fontSize,
              color: const Color(0xFF21899C),
              letterSpacing: 3,
              height: 1.03),
          children: const [
            TextSpan(
                text: 'LOGIN', style: TextStyle(fontWeight: FontWeight.w800)),
            TextSpan(
                text: 'PAGE \n UI',
                style: TextStyle(fontWeight: FontWeight.w800)),
            TextSpan(
                text: 'KIT', style: TextStyle(fontWeight: FontWeight.w800)),
          ]),
      textAlign: TextAlign.center,
    );
  }

  Widget buildButton(String txt, BuildContext context, VoidCallback onPressed) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          height: size.height / 12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1.0, color: Color(0xFF21899C))),
          child: Text(
            txt,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500, fontSize: 16, height: 1.5),
          ),
        ),
      ),
    );
  }
}
