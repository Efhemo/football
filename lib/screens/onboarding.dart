import 'package:flutter/material.dart';
import 'package:football/model/onboarding.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatelessWidget {
  final listOnBoarding = [
    OnBoarding(
        "https://assets7.lottiefiles.com/packages/lf20_e4mqXr/ball_04.json",
        "League",
        "Everything from quoting to voice mail, "
            "to anything soccer goes into here and not is the time to do that"
            "to anything soccer goes into here and not is the time to do that"),
    OnBoarding(
        "https://assets7.lottiefiles.com/packages/lf20_bD8Yze.json",
        "Team",
        "Everything from quoting to voice mail, "
            "to anything soccer goes into here and not is the time to do that"
            "to anything soccer goes into here and not is the time to do that"),
    OnBoarding(
        "https://assets4.lottiefiles.com/datafiles/KbKSrbWahtNPvY6/data.json",
        "News",
        "Everything from quoting to voice mail, "
            "to anything soccer goes into here and not is the time to do that"
            "to anything soccer goes into here and not is the time to do that")
  ];

  final pageIndexNotifier = ValueNotifier<int>(0);
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
              onPageChanged: (index) => pageIndexNotifier.value = index,
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: listOnBoarding.length,
              itemBuilder: (BuildContext context, int index) => OnBoardingItem(
                  onBoarding: listOnBoarding[index], index: index)),
          Positioned(
              bottom: 20.0,
              left: 10.0,
              right: 10.0,
              child:
              ValueListenableBuilder(
                valueListenable: pageIndexNotifier,
                builder: (context, index, child){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {},
                          child: const Text(
                            "Skip",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Row(
                        children: <Widget>[
                          Icon(Icons.arrow_drop_down_circle,
                              size: 6.0,
                              color: index == 0 ? Colors.blue : Colors.grey),
                          Icon(Icons.arrow_drop_down_circle,
                              size: 6.0,
                              color: index == 1 ? Colors.blue : Colors.grey),
                          Icon(Icons.arrow_drop_down_circle,
                              size: 6.0,
                              color: index == 2 ? Colors.blue : Colors.grey)
                        ],
                      ),
                      FlatButton(
                          onPressed: () {
                            if(index != 2){
                              _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                            }else {
                              print("index is $index");
                            }
                          },
                          child: Text(index == 2 ? "Get started" : "Next",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  );
                }
              ))
        ],
      ),
    );
  }
}

class OnBoardingItem extends StatelessWidget {
  final OnBoarding onBoarding;
  final int index;

  const OnBoardingItem({Key key, this.onBoarding, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: LottieBuilder.network(
                onBoarding.imageAsset,
                repeat: false,
                height: height * 0.55,
              ),
            ),
            Text(onBoarding.headerTitle,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold)),
            SizedBox(height: height * 0.03),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                onBoarding.subHeaderTitle,
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
