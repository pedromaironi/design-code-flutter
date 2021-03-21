import 'package:designcode/constants.dart';
import 'package:flutter/material.dart';

import 'components/cards/recent_course_cards.dart';
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
            child: Container(
              color: kBackgroundColor,
              child: 
              Column(
                children: [
                  HomeScreenNavBar(), 
                  RecentCourseCard(course: recentCourses[0],
                  ),
                ],
              ),
          ),
        ),
      )
    );
  }
}

class HomeScreenNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SidebarButton(),
          SearchFieldWidget(),
          Icon(
            Icons.notifications,
            color: kPrimaryLabelColor
          ),
          SizedBox(
            width: 16.0,
          ),
          CircleAvatar(
            radius: 18.0,
            backgroundImage: AssetImage(
              'asset/images/me.png'
            )
          )
        ],
      ),
    );
  }

}

class SearchFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:EdgeInsets.only(left: 12.0, right: 12.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.0),
            boxShadow: [
              BoxShadow(
                color: kShadowColor,
                offset: Offset(0, 12),
                blurRadius: 16.0
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              cursorColor: kPrimaryLabelColor,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search, 
                  color: kPrimaryLabelColor, 
                  size: 20.0,
                ),
                border: InputBorder.none,
                hintText: "Search for course",
                hintStyle: kSearchPlaceholderStyle
              ),
              style: kSearchTextStyle,
              onChanged: (newText) {
                print(newText);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SidebarButton extends StatelessWidget {
  const SidebarButton(
  {
    Key key,
  }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        print("Sidebar button pressed");
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: BoxConstraints(
        maxHeight: 40.0,
        maxWidth: 40.0
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(0,12),
              blurRadius: 16.0
            )
          ]
        ),
        child: Image.asset(
          'asset/icons/icon-sidebar.png',
          color: kPrimaryLabelColor,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 14.0
        ),
      ),
    );
  }
}