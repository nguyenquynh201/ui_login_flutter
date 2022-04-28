import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/widget/button_widget.dart';

class LoginScreenTwo extends StatefulWidget {
  const LoginScreenTwo({Key? key}) : super(key: key);

  @override
  State<LoginScreenTwo> createState() => _LoginScreenTwoState();
}

class _LoginScreenTwoState extends State<LoginScreenTwo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF21899C),
      body: Column(
        children: [
          Expanded(flex: 1, child: Center()),
          Expanded(
              flex: 9,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.05),
                      Text('Login Account',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              fontSize: 24)),
                      SizedBox(height: size.height * 0.01),
                      Text('Discover your social & Try to Login',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500, fontSize: 14)),
                      SizedBox(height: size.height * 0.05),
                      logo(100, 100),
                      SizedBox(height: size.height * 0.03),
                      richText(30),
                      SizedBox(height: size.height * 0.03),
                      emailWidget(size),
                      SizedBox(height: size.height * 0.03),
                      passwordWidget(size),
                      SizedBox(height: size.height * 0.03),
                      ButtonWidget(size: size, title: 'Sign In' , enable: true,onPressed: () => Navigator.pop(context),),
                      Spacer(),
                      buildTextSignUp(),
                      SizedBox(height: size.height * 0.03),
                    ],
                  ),
                ),
              )),
        ],
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
            letterSpacing: 3,
            height: 1.03,
            fontWeight: FontWeight.bold,
          ),
          children: const [
            TextSpan(
                text: 'LOGIN',
                style: TextStyle(
                  color: const Color(0xFF21899C),
                )),
            TextSpan(
                text: 'PAGE', style: TextStyle(color: Colors.orangeAccent)),
          ]),
      textAlign: TextAlign.center,
    );
  }

  Widget emailWidget(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 11,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Color(0xFFEFEFEF), width: 1)),
      child: TextField(
        style: GoogleFonts.inter(
          fontSize: 16.0,
          color: const Color(0xFF15224F),
        ),
        maxLines: 1,
        cursorColor: const Color(0xFF15224F),
        decoration: InputDecoration(
            labelText: 'Email/ Phone number',
            labelStyle: GoogleFonts.inter(
              fontSize: 12.0,
              color: const Color(0xFF969AA8),
            ),
            border: InputBorder.none),
      ),
    );
  }

  Widget passwordWidget(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 11,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Color(0xFFEFEFEF), width: 1)),
      child: TextField(
        style: GoogleFonts.inter(
          fontSize: 16.0,
          color: const Color(0xFF15224F),
        ),
        maxLines: 1,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        cursorColor: const Color(0xFF15224F),
        decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: GoogleFonts.inter(
              fontSize: 12.0,
              color: const Color(0xFF969AA8),
            ),
            suffixIcon: Icon(Icons.visibility),
            border: InputBorder.none),
      ),
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
                  color: Colors.orangeAccent,
                )),
          ]),
      textAlign: TextAlign.center,
    );
  }
}
