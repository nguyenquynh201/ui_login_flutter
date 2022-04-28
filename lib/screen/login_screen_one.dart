import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/widget/button_socal_widget.dart';
import 'package:login_ui/widget/button_widget.dart';
import 'package:login_ui/widget/ui_textinput.dart';

class LoginScreenOne extends StatefulWidget {
  const LoginScreenOne({Key? key}) : super(key: key);

  @override
  State<LoginScreenOne> createState() => _LoginScreenOneState();
}

class _LoginScreenOneState extends State<LoginScreenOne> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo(size.height / 8, size.width / 8),
              SizedBox(height: size.height * 0.03),
              richText(24),
              SizedBox(height: size.height * 0.02),
              UITextInput(size: size, hint: 'Username'),
              UITextInput(
                  size: size,
                  hint: 'Password',
                  keyboardType: TextInputType.visiblePassword),
              ButtonWidget(size: size, title: 'Login', enable: true),
              SizedBox(height: size.height * 0.02),
              buildUIText('Or Sign in with'),
              SizedBox(height: size.height * 0.02),
              ButtonSocialWidget(
                  size: size,
                  text: 'Sign un with Google',
                  iconPath: 'assets/google_logo.svg',
                  colorText: const Color(0xFF134140)),
              SizedBox(height: size.height * 0.02),
              ButtonSocialWidget(
                size: size,
                text: 'Sign un with Apple',
                iconPath: 'assets/apple_logo.svg',
                color: Colors.black,
                colorText: Colors.white,
              ),
              SizedBox(height: size.height * 0.02),
              buildTextSignUp()
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

  Widget buildUIText(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(child: Divider()),
        const SizedBox(width: 16),
        Text(
          text,
          style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF969AA8)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(width: 16),
        const Expanded(child: Divider())
      ],
    );
  }

  Widget buildTextSignUp() {
    return Text.rich(
      TextSpan(
          style:
              GoogleFonts.inter(fontSize: 14, letterSpacing: 1, height: 1.03),
          children: const [
            TextSpan(
                text: "Don't have an account ?",
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Color(0xFF969AA8))),
            TextSpan(
                text: 'Sign up',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF21899C),
                )),
          ]),
      textAlign: TextAlign.center,
    );
  }
}
