import 'package:flutter/material.dart';
import 'package:plant_iot_app2/screen/home/components/ListDevice.dart';
import 'package:plant_iot_app2/screen/home/components/searchTextBox.dart';

class HomeScreenBody1 extends StatefulWidget {
  const HomeScreenBody1({Key? key}) : super(key: key);
  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody1> {
  List<bool> _isOpen = [false, false];
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  final ourterListChildren = <SliverList>[];
  final dataKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    // 滾動效果再由CustomScrollView統一控制
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                // true/false/false
                floating: true,
                pinned: false,
                snap: false,
                expandedHeight: 60,
                backgroundColor: Colors.black,
                title: SearchTextBox(),
                // flexibleSpace: , // 用於折疊、擴展、延伸，常用於SliverAppBar.flexibleSpace字段
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ListTileTheme(
                      minLeadingWidth: 0.0,
                      child: ExpansionTile(
                        maintainState: true,
                        onExpansionChanged: (value) {
                          print(value); // <- true or false
                        },
                        leading: const Icon(Icons.star_border),
                        textColor: Colors.white,
                        collapsedTextColor: Colors.white,
                        backgroundColor: Colors.transparent,
                        iconColor: Colors.white,
                        collapsedIconColor: Colors.white,
                        title: const Text("Controll"),
                        children: [
                          Container(
                            child: buildListView(_controller),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
