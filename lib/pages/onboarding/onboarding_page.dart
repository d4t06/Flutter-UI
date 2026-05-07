import 'package:flutter/material.dart';
import 'package:my_app/components/app_sidebar.dart';
import 'package:my_app/components/app_top_bar.dart';
import 'package:my_app/pages/onboarding/dot_indicator.dart';
import 'package:my_app/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OnboardingPageState();
  }
}

class _OnboardingPageState extends State<OnboardingPage> {
  final pageController = PageController();
  int currentPage = 0;

  bool isLoading = true;
  bool hasSeen = false;
  bool isLast = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkHasSeen();
  }

  Future<void> checkHasSeen() async {
    final prefs = SharedPreferencesAsync();
    final bool isHasSeen = ((await prefs.getBool('has_seen')) ?? false);

    await Future.delayed(Duration(milliseconds: 300));

    setState(() {
      hasSeen = isHasSeen;
      isLoading = false;
    });
  }

  Widget _sliderContent(List<Widget> chidlren) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: chidlren,
    );
  }

  List<Widget> _slides() => [
    _sliderContent([
      Text(
        "Nguyen Huu Dat",
        style: context.text.textXl.bold.withColor(context.colors.primary),
      ),
      Text("Fresher Software Engineering"),
    ]),

    _sliderContent([
      Text(
        "Location",
        style: context.text.textXl.bold.withColor(context.colors.primary),
      ),
      Text("An Giang, Viet Nam"),
    ]),

    _sliderContent([
      Text(
        "Proficiency in",
        style: context.text.textXl.bold.withColor(context.colors.primary),
      ),
      Text("Nodejs, TypeScript, Docker, Linux"),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppSidebar(),
      appBar: AppTopBar(title: "Onboarding "),

      body:
          isLoading
              ? Center(child: CircularProgressIndicator(strokeWidth: 4))
              : !hasSeen
              ? _buildContent(context)
              : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("you has seen this before")),
                  ElevatedButton(
                    child: Text("Reset"),
                    onPressed: () async {
                      final prefs = SharedPreferencesAsync();
                      await prefs.setBool("has_seen", false);

                      setState(() {
                        hasSeen = false;
                      });
                    },
                  ),
                ],
              ),
    );
  }

  Stack _buildContent(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.network(
                  'https://512pixels.net/wp-content/uploads/2025/08/26-Tahoe-Beach-Day-thumb.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;

                    if (index == _slides().length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    }
                  });
                },
                children: _slides(),
              ),
            ),

            Container(
              color: Colors.white,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        pageController.previousPage(
                          duration: Duration(milliseconds: 250),
                          curve: Curves.linear,
                        );
                      },
                      child: Text("black"),
                    ),

                    DotIndicator(
                      count: 3,
                      current: currentPage,
                      size: 10,
                      activeColor: context.colors.primary,
                    ),
                    TextButton(
                      onPressed: () async {
                        if (isLast) {
                          final prefs = SharedPreferencesAsync();
                          await prefs.setBool("has_seen", true);

                          setState(() {
                            hasSeen = true;
                          });
                        } else {
                          pageController.nextPage(
                            duration: Duration(milliseconds: 250),
                            curve: Curves.linear,
                          );
                        }
                      },
                      child: Text(isLast ? "Start" : "Next"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
