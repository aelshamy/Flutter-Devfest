import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devfest_gdg_newdelhi/notifiers/dark_theme_provider.dart';
import 'package:flutter_devfest_gdg_newdelhi/ui/screens/agenda_screen.dart';
import 'package:flutter_devfest_gdg_newdelhi/ui/screens/speaker_list.dart';
import 'package:flutter_devfest_gdg_newdelhi/ui/screens/sponsors.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  Animation<double> animation;
  bool cirAn = false;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
      // reverseCurve: Curves.easeInOut
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    var size = MediaQuery.of(context).size;
    return cirAn
        ? CircularRevealAnimation(
            centerOffset: Offset(size.height / 15, size.width / 3.5),
            animation: animation,
            child: homeBody(
              themeProvider,
            ),
          )
        : homeBody(themeProvider);
  }

  Widget homeBody(DarkThemeProvider themeProvider) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              new Positioned(
                left: MediaQuery.of(context).size.width / 1.15, //230.0,
                bottom: MediaQuery.of(context).size.width / 1,

                child: new Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.height / 5,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).indicatorColor,
                  ),
                ),
              ),
              new Positioned(
                right: MediaQuery.of(context).size.width / 1.2, //230.0,
                bottom: MediaQuery.of(context).size.width / 0.69, //40
                child: new Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.height / 5,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
              new Positioned(
                left: MediaQuery.of(context).size.width / 1.1, //230.0,
                top: MediaQuery.of(context).size.width / 0.8, //40.0,
                child: new Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.height / 4,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).highlightColor,
                  ),
                ),
              ),
              new Positioned(
                right: MediaQuery.of(context).size.width / 1.05, //230.0,
                bottom: MediaQuery.of(context).size.width / 1.3, //40.0,
                child: new Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.height / 8,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).focusColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ),
                ),
              ),
              new Positioned(
                left: MediaQuery.of(context).size.width / 1.1, //230.0,
                bottom: MediaQuery.of(context).size.width / 0.7, //40.0,
                child: new Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.height / 8,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).hintColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ),
                ),
              ),
              new Positioned(
                right: MediaQuery.of(context).size.width / 1.2, //230.0,
                top: MediaQuery.of(context).size.width / 2.5, //40.0,
                child: new Container(
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.height / 12,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).indicatorColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ),
                ),
              ),
              new Positioned(
                right: MediaQuery.of(context).size.width / 1.18, //230.0,
//              bottom: MediaQuery.of(context).size.width / 0.68, //40.0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      cirAn = true;
                    });
                    themeProvider.darkTheme = !themeProvider.darkTheme;

                    if (animationController.status == AnimationStatus.forward || animationController.status == AnimationStatus.completed) {
                      animationController.reset();
                      animationController.forward();
                    } else {
                      animationController.forward();
                    }
                  },
                  child: new Container(
                    height: MediaQuery.of(context).size.height / 5.5,
                    width: MediaQuery.of(context).size.height / 15,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                      shape: BoxShape.rectangle,
                      color: Theme.of(context).hoverColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14, right: 14, bottom: 28),
                      child: themeProvider.darkTheme
                          ? Image.asset(
                              "assets/bulb_off.png",
                              fit: BoxFit.fitHeight,
                            )
                          : Image.asset(
                              "assets/bulb_on.png",
                              fit: BoxFit.fitHeight,
                            ),
                    ),
                  ),
                ),
              ),
              new Positioned(
                right: MediaQuery.of(context).size.width / 1.2, //230.0,
                top: MediaQuery.of(context).size.width / 0.69, //40
                child: new Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.height / 5,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).indicatorColor,
                  ),
                ),
              ),
              new Column(
                children: <Widget>[
                  Flexible(
                    child: new Container(
                      margin: EdgeInsets.only(bottom: 25.0),
                      child: Stack(
                        children: <Widget>[
                          _logo(themeProvider, context),
                        ],
                      ),
                    ),
                    flex: 3,
                  ),
                  Flexible(
                      flex: 6,
                      child: _description(
                        context,
                      )),
                  Flexible(
                    flex: 2,
                    child: _optionsScreen(context),
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
      ),
    );
  }

  Widget _logo(DarkThemeProvider themeChangeProvider, context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 0.0, left: 25.0, right: 25.0),
      height: size.height / 6,
      width: size.width / 2,
      child: GestureDetector(
          onTap: () {}, child: themeChangeProvider.darkTheme ? Image.asset("assets/logo_dark.png") : Image.asset("assets/logo-light.png")),
    );
  }

  Widget _optionsScreen(context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8, top: 20),
      height: MediaQuery.of(context).size.height / 7,
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AgendaScreen(),
                    ),
                  );
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset(
                        "assets/agenda.png",
                        height: size.height / 30,
                      ),
                      Text(
                        'Agenda',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpeakersScreenList(),
                    ),
                  );
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset(
                        "assets/speaker.png",
                        height: size.height / 30,
                      ),
                      Text('Speakers', style: TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
              ),
              InkWell(
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sponsors(),
                    ),
                  );
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset(
                        "assets/sponsors.png",
                        height: size.height / 30,
                      ),
                      Text('Sponsors', style: TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _description(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
        // color: Colors.white,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(text: 'Welcome to \n'),
                    TextSpan(text: 'GDG New Delhi '),
                    TextSpan(text: 'DevFest', style: TextStyle(color: Color(0xff3972CF))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "DevFest'19, our yearly fest, is a really special event for us. It describes both, 'The Community Spirit' and 'The Developer Spirit' to keep learning, sharing and developing solutions together.This year it's going to be shaped like a tech conference with experts from a number of domains including Web, Cloud, Android, Flutter, AR/VR, Security, Firebase, ML, Python, IoT, Design, UX, UI, Kotlin and the list continues.What's more? Obviously, goodies!There's going to be a number of activities in and around the event, be sure to participate!",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 8,
                ),
              ),
              FlatButton(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(image: AssetImage('assets/button.png'), fit: BoxFit.cover),
                  ),
                  child: Text(
                    "Register Now",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
                onPressed: () async {
                  if (await canLaunch("https://commudle.com/gdg-new-delhi/events/devfest-19")) {
                    await launch("https://commudle.com/gdg-new-delhi/events/devfest-19");
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _socialButton(
                    imgUrl: "assets/twitter_light_theme.png",
                    url: "https://twitter.com/gdg_nd?lang=en",
                  ),
                  _socialButton(
                    imgUrl: "assets/github.png",
                    url: "https://github.com/gdgnewdelhi",
                  ),
                  _socialButton(
                    imgUrl: "assets/linkedin_light_theme.png",
                    url: "https://www.linkedin.com/company/gdgcloudnd/",
                  ),
                  _socialButton(
                    imgUrl: "assets/facebook_light_theme.png",
                    url: "https://www.facebook.com/gdgnewdelhi/",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButton({String imgUrl, String url}) {
    return ConstrainedBox(
      child: FlatButton(
        padding: EdgeInsets.all(8),
        color: Theme.of(context).buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Image.asset(imgUrl),
        onPressed: () async {
          if (await canLaunch(url)) {
            await launch(url);
          }
        },
      ),
      constraints: BoxConstraints(maxHeight: 30, maxWidth: 30),
    );
  }
}
