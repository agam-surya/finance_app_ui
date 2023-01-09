import 'package:finance_app_ui/common/constant.dart';
import 'package:finance_app_ui/screen/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(outPadding),
        width: size.width,
        height: size.height,
        color: Scolor,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.6,
                    child: const Image(
                        image: AssetImage("assets/splash-logo.png")),
                  ),
                  const Expanded(
                    child: Text(
                      "Find ways to manage your finances.",
                      style: TextStyle(color: whiteC, fontSize: 34),
                      softWrap: true,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Pcolor),
                fixedSize:
                    MaterialStateProperty.all(Size(size.width * 0.9, 70)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: const Text(
                "Let's Start",
                style: TextStyle(
                  color: Scolor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
