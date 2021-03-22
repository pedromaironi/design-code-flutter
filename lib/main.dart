import 'package:designcode/components/lists/recent_course_list.dart';
import 'package:designcode/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'components/cards/recent_course_cards.dart';
import 'components/home_screen_navbar.dart';
import 'model/course.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: ListView(
                          children: [Container(
                color: kBackgroundColor,
                child: 
                Column(
                  children: [
                    HomeScreenNavBar(), 
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
      )
    );
  }
}

class ExploreCourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:100.0),
      child: Container(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: exploreCourses.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 20.0 : 0.0),
              child: ExploreCourseCard(
                course: exploreCourses[index]
              ),
            );
          },
        ),
      ),
    );
  }
}

class ExploreCourseCard extends StatelessWidget {
  ExploreCourseCard({@required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41.0),
        child: Container(
          height: 120.0,
          width: 280.0,
          decoration: BoxDecoration(
            gradient: course.background
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 32.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 6.0
                      ),
                      Text(course.courseSubtitle, style: kCardSubtitleStyle),
                      Text(course.courseTitle, style: kCardTitleStyle),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'asset/illustrations/${course.illustration}',
                       fit: BoxFit.cover,
                       height: 100.0,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

