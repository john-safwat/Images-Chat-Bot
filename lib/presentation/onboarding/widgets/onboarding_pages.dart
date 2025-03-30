import 'package:animate_do/animate_do.dart';
import 'package:chat_bot/core/di/di.dart';
import 'package:chat_bot/core/extentions/number_ext.dart';
import 'package:chat_bot/core/providers/app_config_provider.dart';
import 'package:chat_bot/core/routes/app_routs.dart';
import 'package:chat_bot/core/theme/app_colors.dart';
import 'package:chat_bot/gen/assets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnboardingPages extends StatefulWidget {
  final List<(String, String)> pageContent;

  const OnboardingPages({required this.pageContent, super.key});

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  AppConfigProvider appConfigProvider = getIt<AppConfigProvider>();

  final List<String> lightImages = [
    Assets.onBoarding1Light,
    Assets.onBoarding2Light,
    Assets.onBoarding3Light,
  ];

  final List<String> darkImages = [
    Assets.onBoarding1Dark,
    Assets.onBoarding2Dark,
    Assets.onBoarding3Dark,
  ];

  PageController controller = PageController();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        var width = MediaQuery.of(context).size.width;
        if(details.globalPosition.dx < width * 0.5){
          if(selectedIndex < widget.pageContent.length - 1){
            _nextPage();
          }
        }
        if(details.globalPosition.dx > width * 0.5){
          _previousPage();
        }
      },
      onVerticalDragEnd: (details) {
        var height = MediaQuery.of(context).size.height;
        if(details.globalPosition.dy < height * 0.5){
          if(selectedIndex < widget.pageContent.length - 1){
            _nextPage();
          }
        }
        if(details.globalPosition.dy > height * 0.5){
          _previousPage();
        }
      },
      child: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            controller: controller,
            itemBuilder: (context, index) => Image.asset(
              appConfigProvider.isDark() ? darkImages[index] : lightImages[index],
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            itemCount: darkImages.length,
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.secondary.withValues(alpha: 0.4),
                  Colors.transparent
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SlideInUp(
                      key: UniqueKey(),
                      child: ZoomIn(
                        key: UniqueKey(),
                        child: Text(
                          widget.pageContent[selectedIndex].$1,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                        ),
                      ),
                    ),
                    16.spaceVertical,
                    SlideInUp(
                      key: UniqueKey(),
                      child: ZoomIn(
                        key: UniqueKey(),
                        child: Text(
                          key: UniqueKey(),
                          widget.pageContent[selectedIndex].$2,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                    16.spaceVertical,
                    Row(
                      children: [
                        ...darkImages.map(
                          (e) => Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                height: 8,
                                width: selectedIndex == darkImages.indexOf(e)
                                    ? 32
                                    : 8,
                                decoration: BoxDecoration(
                                    color: selectedIndex ==
                                            darkImages.indexOf(e)
                                        ? Theme.of(context).colorScheme.primary
                                        : AppColors.gray,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                              8.spaceHorizontal,
                            ],
                          ),
                        ),
                        const Spacer(),
                        if (selectedIndex != 0)
                          ZoomIn(
                            duration: const Duration(milliseconds: 400),
                            child: IconButton(
                              onPressed: () {
                                _previousPage();
                              },
                              icon: const Icon(Icons.arrow_back_ios),
                            ),
                          ),
                        8.spaceHorizontal,
                        FilledButton(
                          onPressed: () {
                            _nextPage();
                          },
                          child: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _previousPage() {
    if (selectedIndex == 0) {
      return;
    }
    controller.animateToPage(
      selectedIndex - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
    selectedIndex--;
    setState(() {});
  }

  void _nextPage() {
    if (selectedIndex == 2) {
      Navigator.pushReplacementNamed(context, AppRouts.actionSelection);
      return;
    }
    controller.animateToPage(
      selectedIndex + 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
    selectedIndex++;
    setState(() {});
  }
}
