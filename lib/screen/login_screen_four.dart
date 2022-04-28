import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreenFour extends StatefulWidget {
  const LoginScreenFour({Key? key}) : super(key: key);

  @override
  State<LoginScreenFour> createState() => _LoginScreenFourState();
}

class _LoginScreenFourState extends State<LoginScreenFour> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [buildCard(size), buildFooter(size)],
          ),
        ),
      ),
    );
  }

  Widget buildCard(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height * 0.8,
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logo(size.height / 8, size.width / 8),
                  SizedBox(height: size.height * 0.03),
                  richText(24)
                ],
              )),
          Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  emailWidget(size),
                  SizedBox(height: size.height * 0.03),
                  passwordWidget(size),
                  SizedBox(height: size.height * 0.01),
                  buildForgotRemember(size)
                ],
              )),
          Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton(size),
                  SizedBox(height: size.height * 0.01),
                  buildOfAccount(size),
                  SizedBox(height: size.height * 0.01),
                  fb_gg_button(size)
                ],
              ))
        ],
      ),
    );
  }

  Widget buildFooter(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.03),
      child: Text.rich(
        TextSpan(
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.black,
              height: 1.03,
              fontWeight: FontWeight.w600,
            ),
            children: const [
              TextSpan(
                  text: "Don't hava an account?",
                  style: TextStyle(
                    color: const Color(0xFF21899C),
                  )),
              TextSpan(
                  text: 'Sign UP',
                  style: TextStyle(color: Colors.orangeAccent)),
            ]),
        textAlign: TextAlign.center,
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
    return SizedBox(
        height: size.height / 12,
        child: TextField(
          controller: emailController,
          style:
              GoogleFonts.inter(fontSize: 18, color: const Color(0xFF151624)),
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'Enter your email',
              hintStyle: GoogleFonts.inter(
                  fontSize: 16,
                  color: const Color(0xFF151624).withOpacity(0.5)),
              fillColor: emailController.text.isNotEmpty
                  ? Colors.transparent
                  : const Color.fromRGBO(248, 247, 251, 1),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    color: emailController.text.isEmpty
                        ? Colors.transparent
                        : const Color.fromRGBO(44, 185, 176, 1),
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(44, 185, 176, 1),
                  ),
                  borderRadius: BorderRadius.circular(40)),
              prefixIcon: Icon(
                Icons.mail_outline_outlined,
                color: emailController.text.isEmpty
                    ? const Color(0xFF151624).withOpacity(0.5)
                    : const Color.fromRGBO(44, 185, 176, 1),
                size: 16,
              ),
              suffix: Container(
                alignment: Alignment.center,
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromRGBO(44, 185, 176, 1),
                ),
                child: emailController.text.isEmpty
                    ? const Center()
                    : const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 13,
                      ),
              )),
        ));
  }

  Widget passwordWidget(Size size) {
    return SizedBox(
        height: size.height / 12,
        child: TextField(
          controller: passwordController,
          style:
              GoogleFonts.inter(fontSize: 18, color: const Color(0xFF151624)),
          maxLines: 1,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              hintText: 'Enter your password',
              hintStyle: GoogleFonts.inter(
                  fontSize: 16,
                  color: const Color(0xFF151624).withOpacity(0.5)),
              fillColor: passwordController.text.isNotEmpty
                  ? Colors.transparent
                  : const Color.fromRGBO(248, 247, 251, 1),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    color: passwordController.text.isEmpty
                        ? Colors.transparent
                        : const Color.fromRGBO(44, 185, 176, 1),
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(44, 185, 176, 1),
                  ),
                  borderRadius: BorderRadius.circular(40)),
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: passwordController.text.isEmpty
                    ? const Color(0xFF151624).withOpacity(0.5)
                    : const Color.fromRGBO(44, 185, 176, 1),
                size: 16,
              ),
              suffix: Container(
                alignment: Alignment.center,
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromRGBO(44, 185, 176, 1),
                ),
                child: emailController.text.isEmpty
                    ? const Center()
                    : const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 13,
                      ),
              )),
        ));
  }

  Widget buildForgotRemember(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: const Color(0xFF21899C),
                borderRadius: BorderRadius.circular(5)),
            child: const Icon(
              Icons.check,
              size: 13,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 8),
          Text('Remember me',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500)),
          Spacer(),
          Text('Forget password?',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFF21899C),
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget buildButton(Size size) {
    return Container(
      height: size.height / 13,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
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

  Widget buildOfAccount(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 2, child: Divider()),
        Expanded(
          flex: 3,
          child: Text(
            "Don't Have Account",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: const Color(0xFF151624).withOpacity(0.5)),
          ),
        ),
        Expanded(flex: 2, child: Divider()),
      ],
    );
  }
  Widget fb_gg_button(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: size.width / 2.8,
          height: size.height / 13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1.0,
              color: const Color(0xFFEA4335)
            )
          ),child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 24,
              height: 24,
              color: const Color(0xFFC4C4C4).withOpacity(0.0),
              child: SvgPicture.asset('assets/google_logo.svg'),

            ),
            const SizedBox(width: 16,),
            Text('Google' , style : GoogleFonts.inter(
              fontSize: 14 , fontWeight: FontWeight.w500 ,  color: const Color(0xFFEA4335),
            ))
          ],
        ),
        ),
        const SizedBox(width: 16,),
        Container(
          alignment: Alignment.center,
          width: size.width / 2.8,
          height: size.height / 13,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 1.0,
                  color: const Color(0xFF4285F4),
              )
          ),child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 24,
              height: 24,
              color: const Color(0xFF4285F4).withOpacity(0.0),
              child: SvgPicture.asset('assets/google_logo.svg'),

            ),
            const SizedBox(width: 16,),
            Text('Facebook' , style : GoogleFonts.inter(
              fontSize: 14 , fontWeight: FontWeight.w500 ,  color: const Color(0xFF4285F4),
            ))
          ],
        ),
        ),
      ],
    );
  }
}
