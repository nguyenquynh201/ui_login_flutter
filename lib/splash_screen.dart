import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const MainScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [logo(160, 160), const SizedBox(height: 25), richText(30)],
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
}
