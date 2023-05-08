import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/pages/login_page.dart';
import '../widget/realisable_text.dart';
import '../models/welcome_model.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: welcomeComponents.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              WelcomeModel current = welcomeComponents[index];
              return SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width,
                      height: size.height * 0.4,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.1,
                            top: size.height * 0.04,
                            right: size.width * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                    text: current.title,
                                    size: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                AppText(
                                  text: current.subTitle,
                                  size: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.02),
                                  child: SizedBox(
                                    width: size.width * 0.8,
                                    child: AppText(
                                      text: current.description,
                                      size: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.08),
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    minWidth: size.width * 0.3 ,
                                    height: size.height * 0.055,
                                    color: Colors.deepPurpleAccent,
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen()));
                                    },
                                    child: const AppText(
                                      text: "Let's Go",
                                      size: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: List.generate(
                                3,
                                (indexDots) => GestureDetector(
                                  onTap: () {
                                    pageController.animateToPage(
                                      indexDots,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.linear,
                                    );
                                  },
                                  child: AnimatedContainer(
                                    margin: EdgeInsets.only(
                                        right: size.width * 0.01,
                                        bottom: size.height * 0.008),
                                    width: 10,
                                    height: index == indexDots ? 55 : 10,
                                    duration: const Duration(milliseconds: 200),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: index == indexDots
                                          ? Colors.deepPurpleAccent
                                          : const Color.fromARGB(
                                              255, 193, 170, 255),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}