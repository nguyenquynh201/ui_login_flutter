import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/widget/button_widget.dart';

class LoginScreenThree extends StatefulWidget {
  const LoginScreenThree({Key? key}) : super(key: key);

  @override
  State<LoginScreenThree> createState() => _LoginScreenThreeState();
}

class _LoginScreenThreeState extends State<LoginScreenThree> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF21899C),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  left: -26,
                  top: 51.0,
                  child: SvgPicture.asset('assets/small1bg.svg',
                      width: 91.91, height: 91.91)),
              Positioned(
                  right: 43.0,
                  top: -103,
                  child: SvgPicture.asset('assets/bigbg.svg',
                      width: 268.27, height: 268.27)),
              Positioned(
                  right: -19.0,
                  top: 31,
                  child: SvgPicture.asset('assets/small2bg.svg',
                      width: 65, height: 65)),
              Positioned(
                  bottom: 20,
                  child: Column(
                    children: [buildCard(size), buildFooter(size)],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(Size size) {
    return Container(
      alignment: Alignment.center,
      width: size.width * 0.9,
      height: size.height * 0.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo(size.height / 8, size.width / 8),
          SizedBox(height: size.height * 0.03),
          richText(24),
          SizedBox(height: size.height * 0.05),
          buildEmailTextField(size),
          SizedBox(height: size.height * 0.02),
          buildPasswordTextField(size),
          SizedBox(height: size.height * 0.02),
          buildButton(size),
          SizedBox(height: size.height * 0.02),
          buildForgotRemember(),
          SizedBox(height: size.height * 0.04),
        ],
      ),
    );
  }

  Widget buildFooter(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: size.height * 0.04),
        SizedBox(
          width: size.width * 0.6,
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                child: SvgPicture.asset('assets/google_logo.svg',
                    width: 22.44, height: 22.44),
              ),
              SizedBox(width: 16),
              Container(
                alignment: Alignment.center,
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                child: SvgPicture.asset('assets/apple_logo.svg',
                    color: Colors.black, width: 22.44, height: 22.44),
              ),
              SizedBox(width: 16),
              Container(
                alignment: Alignment.center,
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                child: SvgPicture.asset('assets/apple_logo.svg',
                    color: Colors.black, width: 22.44, height: 22.44),
              ),
            ],
          ),
        ),
        SizedBox(height: size.height * 0.02),
        Text.rich(TextSpan(
            style: GoogleFonts.inter(
                fontSize: 12.0,
                color: Colors.white,
                fontWeight: FontWeight.w600),
            children: [
              TextSpan(text: "Don't have an account?"),
              TextSpan(
                  text: "Sign Up",
                  style: TextStyle(color: Colors.orangeAccent)),
            ]))
      ],
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

  Widget buildEmailTextField(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: size.height / 12,
        child: TextField(
          controller: emailController,
          style: GoogleFonts.inter(
              fontSize: 18, color: const Color(0xFF151624).withOpacity(0.5)),
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          cursorColor: const Color(0xFF151624),
          decoration: InputDecoration(
              hintText: 'Enter your email',
              hintStyle: GoogleFonts.inter(
                  fontSize: 16,
                  color: const Color(0xFF151624).withOpacity(0.5)),
              filled: true,
              fillColor: emailController.text.isEmpty
                  ? const Color.fromRGBO(248, 247, 251, 1)
                  : Colors.transparent,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                      color: emailController.text.isEmpty
                          ? Colors.transparent
                          : Color.fromRGBO(44, 185, 176, 1))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                      color: emailController.text.isEmpty
                          ? Colors.transparent
                          : Color.fromRGBO(44, 185, 176, 1))),
              prefixIcon: Icon(Icons.mail_outline_rounded,
                  color: emailController.text.isEmpty
                      ? const Color(0xFF151624).withOpacity(0.5)
                      : const Color.fromRGBO(44, 185, 176, 1),
                  size: 16),
              suffix: Container(
                alignment: Alignment.center,
                width: 24.0,
                height: 24.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromRGBO(44, 185, 176, 1)),
                child: emailController.text.isEmpty
                    ? const Center()
                    : const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 13,
                      ),
              )),
        ),
      ),
    );
  }

  Widget buildPasswordTextField(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: size.height / 12,
        child: TextField(
          controller: passwordController,
          style: GoogleFonts.inter(
              fontSize: 18, color: const Color(0xFF151624).withOpacity(0.5)),
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          cursorColor: const Color(0xFF151624),
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Enter your password',
              hintStyle: GoogleFonts.inter(
                  fontSize: 16,
                  color: const Color(0xFF151624).withOpacity(0.5)),
              filled: true,
              fillColor: passwordController.text.isEmpty
                  ? const Color.fromRGBO(248, 247, 251, 1)
                  : Colors.transparent,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                      color: passwordController.text.isEmpty
                          ? Colors.transparent
                          : Color.fromRGBO(44, 185, 176, 1))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                      color: passwordController.text.isEmpty
                          ? Colors.transparent
                          : Color.fromRGBO(44, 185, 176, 1))),
              prefixIcon: Icon(Icons.lock_outline_rounded,
                  color: passwordController  .text.isEmpty
                      ? const Color(0xFF151624).withOpacity(0.5)
                      : const Color.fromRGBO(44, 185, 176, 1),
                  size: 16),
              suffix: Container(
                alignment: Alignment.center,
                width: 24.0,
                height: 24.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromRGBO(44, 185, 176, 1)),
                child: emailController.text.isEmpty
                    ? const Center()
                    : const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 13,
                      ),
              )),
        ),
      ),
    );
  }

  Widget buildButton(Size size) {
    return Container(
      width: size.width * 0.7,
      height: size.height / 13,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xFF21899C),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 15),
                color: const Color(0xFF21899C).withOpacity(0.2),
                blurRadius: 60.0),
          ]),
      child: Text(
        'Sign In',
        style: GoogleFonts.inter(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            height: 1.5),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildForgotRemember() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFF21899C)),
            child: const Icon(Icons.check, size: 13, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Text(
            'Remember me',
            style:
                GoogleFonts.inter(fontSize: 15, color: const Color(0xFF0C0D34)),
          ),
          const Spacer(),
          Text(
            'Forgot Password',
            style: GoogleFonts.inter(
                fontSize: 13,
                color: Color(0xFF31899C),
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
