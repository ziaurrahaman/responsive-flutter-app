import 'package:flutter/material.dart';
import 'package:responsive_app_demo_project/utils/images.dart';
import 'package:responsive_app_demo_project/utils/size_configue.dart';
import 'package:responsive_app_demo_project/utils/strings.dart';
import 'package:responsive_app_demo_project/utils/styling.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom:
                        Radius.circular(3.0 * SizeConfigue.heightMultiplier),
                  ),
                ),
                constraints: BoxConstraints(
                    maxHeight: 28 *
                        (SizeConfigue.isMobilePotrait
                            ? SizeConfigue.heightMultiplier
                            : SizeConfigue.widthMultiplier)),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    FractionallySizedBox(
                      heightFactor: SizeConfigue.isMobilePotrait ? 0.20 : 0.18,
                      alignment: Alignment.bottomCenter,
                      child: Tabs(),
                    ),
                    ResponsiveWidget(
                      portraitLayout: TopContainerPortrait(),
                      landscapeLayout: TopContainerLandscape(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResponsiveWidget extends StatelessWidget {
  final Widget portraitLayout;
  final Widget landscapeLayout;
  ResponsiveWidget(
      {Key? key, required this.landscapeLayout, required this.portraitLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (SizeConfigue.isPotrait && SizeConfigue.isMobilePotrait)
        ? portraitLayout
        : landscapeLayout;
  }
}

class Tabs extends StatelessWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: AppTheme.selectedTabBackgroundColor,
                borderRadius: BorderRadius.vertical(
                    bottom:
                        Radius.circular(3.0 * SizeConfigue.heightMultiplier))),
            child: Align(
              alignment:
                  Alignment(0, SizeConfigue.isMobilePotrait ? 0.3 : 0.35),
              child: Text(
                Strings.lessons,
                style: Theme.of(context).textTheme.body1,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: AppTheme.unSelectedTabBackgroundColor,
                borderRadius: BorderRadius.vertical(
                    bottom:
                        Radius.circular(3.0 * SizeConfigue.heightMultiplier))),
            child: Align(
              alignment:
                  Alignment(0, SizeConfigue.isMobilePotrait ? 0.3 : 0.35),
              child: Text(
                Strings.myClasses,
                style: Theme.of(context).textTheme.body2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TopContainerPortrait extends StatelessWidget {
  const TopContainerPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.80,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 2.0 * SizeConfigue.heightMultiplier),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(24.0),
          ),
          color: AppTheme.topBarBackgroundColor,
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  ProfileImage(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 4 * SizeConfigue.widthMultiplier),
                      child: Text(
                        Strings.greetingMessage,
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.blur_on,
                    size: 8 * SizeConfigue.imageSizeMultiplier,
                  )
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: FittedBox(
                  child: Text(
                    Strings.whatLearnToday,
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 2 * SizeConfigue.heightMultiplier,
                bottom: 2.5 * SizeConfigue.heightMultiplier,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2 * SizeConfigue.heightMultiplier),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(24),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            size: 3 * SizeConfigue.heightMultiplier,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 1 * SizeConfigue.heightMultiplier,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: Strings.searchHere,
                                ),
                                style: Theme.of(context).textTheme.display2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 1 * SizeConfigue.heightMultiplier),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              3.0 * SizeConfigue.heightMultiplier),
                          bottomLeft: Radius.circular(
                              3.0 * SizeConfigue.heightMultiplier),
                        ),
                      ),
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 6 * SizeConfigue.imageSizeMultiplier,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopContainerLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.82,
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(24.0),
          ),
          color: AppTheme.topBarBackgroundColor,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 2.0 * SizeConfigue.heightMultiplier,
                  right: 2.0 * SizeConfigue.heightMultiplier,
                  top: 1.0 * SizeConfigue.heightMultiplier,
                ),
                child: Row(
                  children: <Widget>[
                    ProfileImage(),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 1 * SizeConfigue.heightMultiplier,
                        ),
                        child: Text(
                          Strings.greetingMessage,
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2 * SizeConfigue.heightMultiplier),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              size: 3 * SizeConfigue.heightMultiplier,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 1 * SizeConfigue.heightMultiplier,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.searchHere,
                                  ),
                                  style: Theme.of(context).textTheme.display2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.blur_on,
                      size: 8 * SizeConfigue.imageSizeMultiplier,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 2.0 * SizeConfigue.heightMultiplier,
                    bottom: 1.5 * SizeConfigue.heightMultiplier),
                child: Row(
                  children: <Widget>[
                    Text(
                      Strings.whatLearnToday,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Spacer(),
                    Container(
                      width: 10 * SizeConfigue.heightMultiplier,
                      padding: EdgeInsets.symmetric(
                          vertical: 1 * SizeConfigue.heightMultiplier),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              3.0 * SizeConfigue.heightMultiplier),
                          bottomLeft: Radius.circular(
                              3.0 * SizeConfigue.heightMultiplier),
                        ),
                      ),
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 6 * SizeConfigue.imageSizeMultiplier,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
        color: Colors.pinkAccent.withOpacity(0.4),
      ),
      child: Image.asset(
        Images.profileImage,
        width: 15 * SizeConfigue.imageSizeMultiplier,
        height: 15 * SizeConfigue.imageSizeMultiplier,
      ),
    );
  }
}
