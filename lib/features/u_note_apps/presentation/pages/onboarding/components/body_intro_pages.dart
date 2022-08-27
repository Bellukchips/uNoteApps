part of '../intro_pages.dart';

class BodyIntroPages extends StatefulWidget {
  const BodyIntroPages({Key? key}) : super(key: key);

  @override
  State<BodyIntroPages> createState() => _BodyIntroPagesState();
}

class _BodyIntroPagesState extends State<BodyIntroPages> {
  //currentPage
  int? currentPage = 0;

  //page controller
  final PageController _pageController = PageController();

  // data intro

  List<Map<String, String>> dataIntro = [
    {
      'image': ImageAssets.get(ImageAssets.imgReminder),
      'subtitle': Strings.intro1Text,
    },
    {
      'image': ImageAssets.get(ImageAssets.imgInvest),
      'subtitle': Strings.intro2Text
    },
    {
      'image': ImageAssets.get(ImageAssets.imgCreateNote),
      'subtitle': Strings.intro3Text
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
              itemCount: dataIntro.length,
              itemBuilder: (ctx, index) => IntroContent(
                image: dataIntro[index]['image'],
                subtitle: dataIntro[index]['subtitle'],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  dataIntro.length,
                  (index) => LongDots(
                        animatedDuration: const Duration(milliseconds: 300),
                        currentPage: currentPage,
                        index: index,
                        currentColor: ColorApp.primaryColor,
                        secondColor: ColorApp.dotSecondColor,
                        widthOnChange: 50,
                      )),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 30, right: 20, left: 20),
              child: (currentPage == dataIntro.length - 1)
                  ? CustomElevationButton(
                      height: 52,
                      width: 363,
                      color: ColorApp.primaryColor,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (_) => const AuthenticationPage()));
                      },
                      style: FontApp.primaryStyle.copyWith(color: Colors.white),
                      text: Strings.mulaiAjaDulu,
                    )
                  : ButtonSkipAndNext(
                      onSkip: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (_) => const AuthenticationPage()));
                      },
                      onNext: () {
                        setState(() {
                          _pageController.jumpToPage(currentPage! + 1);
                        });
                      },
                    ))
        ],
      ),
    );
  }
}
