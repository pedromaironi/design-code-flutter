import 'package:designcode/screens/sidebar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:designcode/constants.dart';
import 'package:designcode/components/lists/explore_course_list.dart';
import 'package:designcode/components/lists/recent_course_list.dart';
import 'package:designcode/components/home_screen_navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{

  Animation<Offset> sidebarAnimation;
  AnimationController sidebarAnimationController;

  @override
  void initState() {
    super.initState();
    sidebarAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 250
      )
    );

    sidebarAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: sidebarAnimationController,
        curve: Curves.easeInOut
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
              children: [SafeArea(
          child: ListView(
              children: [Container(
              color: kBackgroundColor,
              child:
              Column(
                children: [
                  HomeScreenNavBar(triggerAnimation: (){
                    sidebarAnimationController.forward();
                  },),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                        "Recent",
                        style: kLargeTitleStyle
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                        "23 courses, more coming", 
                        style: kSubtitleStyle
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RecentCourseList(),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 25.0,
                      bottom: 16.0
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Explore", style: kTitle1Style,)
                      ],
                    ),
                  ),
                  ExploreCourseList(),
                ],
              ),
            )],
          ),
        ),
        SlideTransition(
          position: sidebarAnimation,
          child: SafeArea(
            child:SidebarScreen(),
            bottom: false,
          ),
        ),
        ],
      ),
    );
  }
}




