import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:plant_iot_app2/screen/home/components/searchTextBox.dart';

AppBar buildAppBar(context) {
  Size size = MediaQuery.of(context).size;
  final dateToday = DateTime.now();
  final date = DateFormat.yMMMMd('en_US').format(dateToday);
  return AppBar(
    toolbarHeight: size.height * 0.09,
    backgroundColor: Colors.black,
    elevation: 5,
    // centerTitle: true,
    title: InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        print('點選了');
      },
      child: Row(
        children: [
          CircleAvatar(
            child: Image.asset("assets/images/beSmile.jpg"),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 水平靠左
              children: [
                const Text(
                  "Author: C.YH",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Raleway',
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Text(
                  '$date',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    leading: Builder(
      builder: (context) => IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.access_alarm_outlined),
        color: Colors.white,
        highlightColor: Colors.transparent, // 按住按鈕時，突出顯示會快速淡入。
        splashColor: Colors.transparent, // 按鈕處於按下（按下）狀態時按鈕的原色。
        onPressed: () => print("alert_icon"),
      ),
      IconButton(
        icon: const Icon(Icons.settings),
        color: Colors.white,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () async => {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              isScrollControlled: true, // full height
              isDismissible: true,
              enableDrag: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              builder: (BuildContext context) => buildSheet())
        },
      ),
    ],
  );
}

Widget buildSheet() => FractionallySizedBox(
      heightFactor: 0.85,
      child: DraggableScrollableSheet(
        initialChildSize: 0.85,
        maxChildSize: 0.99,
        minChildSize: 0.35,
        expand: true,
        builder: (context, scrollController) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                // true/false/false
                floating: true,
                pinned: false,
                snap: false,
                expandedHeight: 60,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: SearchTextBox(),
                // flexibleSpace: , // 用於折疊、擴展、延伸，常用於SliverAppBar.flexibleSpace字段
              ),
            ],
          );
        },
      ),
    );
