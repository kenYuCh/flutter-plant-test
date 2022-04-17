import 'package:flutter/material.dart';
import 'package:plant_iot_app2/screen/home/components/searchTextBox.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);
  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
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

  @override
  Widget build(BuildContext context) {
    int _value = 1;
    /*
    Flutter 中一塊可捲動的區域被稱為 Silver，ListView、GridView 等，底層各自管理著自己的 Silver；
    如果你想組合 Silver，並讓由一個元件來統一管理組合後的結果，可以透過 CustomScrollView
    */
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      child: CustomScrollView(
        controller: _controller,
        // shrinkWrap: true,
        // physics: ScrollPhysics(),
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
                // title 左側內文預設padding，解決方法使用 ListTileTheme horizontalTitleGap-gap
                ListTileTheme(
                  key: const Key("list1"),
                  // dense: true,
                  horizontalTitleGap: 8.0,
                  minLeadingWidth: 0,
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
                    // tilePadding: EdgeInsets.only(left: 0),
                    title: const Text(
                      "Title1",
                      style: TextStyle(color: Colors.white),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          // height: 100,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemExtent: 50.0,
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                // height: 50.0,
                                child: Text(
                                  "$index",
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTileTheme(
                  key: const Key("list2"),
                  // dense: true,
                  horizontalTitleGap: 8.0,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    onExpansionChanged: (value) {
                      print(value); // <- true or false
                    },
                    leading: Icon(Icons.star_border),
                    textColor: Colors.white,
                    collapsedTextColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    // tilePadding: EdgeInsets.only(left: 0),
                    title: Text(
                      "Title2",
                      style: TextStyle(color: Colors.white),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          // height: 100,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemExtent: 50.0, // 務必加入
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Text(
                                  "$index",
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // CustomScrollView+SliverList組合就相當於一個ListView
          SliverList(
            //SliverChildBuilderDelegate 可實現延遲載入
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                height: 50.0,
                child: Text(
                  "$index",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}



// Padding(
//       padding: EdgeInsets.symmetric(horizontal: 0.0),
//       child: CustomScrollView(
//         shrinkWrap: true,
//         slivers: [
//           const SliverAppBar(
//             // true/false/false
//             floating: true,
//             pinned: false,
//             snap: false,
//             expandedHeight: 60,
//             backgroundColor: Colors.black,
//             title: SearchTextBox(),
//             // flexibleSpace: , // 用於折疊、擴展、延伸，常用於SliverAppBar.flexibleSpace字段
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 // title 左側內文預設padding，解決方法使用 ListTileTheme horizontalTitleGap-gap
//                 ListTileTheme(
//                   // dense: true,
//                   horizontalTitleGap: 8.0,
//                   minLeadingWidth: 0,
//                   child: ExpansionTile(
//                     onExpansionChanged: (value) {
//                       print(value); // <- true or false
//                     },
//                     leading: Icon(Icons.star_border),
//                     textColor: Colors.white,
//                     collapsedTextColor: Colors.white,
//                     backgroundColor: Colors.transparent,
//                     iconColor: Colors.white,
//                     collapsedIconColor: Colors.white,
//                     // tilePadding: EdgeInsets.only(left: 0),
//                     title: Text(
//                       "Title",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     children: [
//                       Scrollbar(
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 20.0),
//                           child: Container(
//                             // height: 100,
//                             child: ListView.builder(
//                               shrinkWrap: true,
//                               physics: ScrollPhysics(),
//                               itemCount: 10,
//                               itemBuilder: (context, index) {
//                                 return Container(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 20.0),
//                                   height: 50.0,
//                                   child: Text(
//                                     "$index",
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ListTileTheme(
//                   // dense: true,
//                   horizontalTitleGap: 8.0,
//                   minLeadingWidth: 0,
//                   child: ExpansionTile(
//                     onExpansionChanged: (value) {
//                       print(value); // <- true or false
//                     },
//                     leading: Icon(Icons.star_border),
//                     textColor: Colors.white,
//                     collapsedTextColor: Colors.white,
//                     backgroundColor: Colors.transparent,
//                     iconColor: Colors.white,
//                     collapsedIconColor: Colors.white,
//                     // tilePadding: EdgeInsets.only(left: 0),
//                     title: Text(
//                       "Title",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     children: [
//                       Scrollbar(
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 20.0),
//                           child: Container(
//                             // height: 100,
//                             child: ListView.builder(
//                               shrinkWrap: true,
//                               physics: ScrollPhysics(),
//                               itemCount: 10,
//                               itemBuilder: (context, index) {
//                                 return Container(
//                                   height: 20.0,
//                                   child: Text(
//                                     '$index',
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // SliverAppBar(
//           //   // 往下瀏覽 title被固定
//           //   floating: true,
//           //   pinned: true,
//           //   snap: true,
//           //   expandedHeight: 60,
//           //   backgroundColor: Colors.black,
//           //   title: Text(
//           //     "Test1",
//           //     style: TextStyle(color: Colors.amber),
//           //   ),
//           // ),

//           // CustomScrollView+SliverList組合就相當於一個ListView
//           SliverList(
//             //SliverChildBuilderDelegate 可實現延遲載入
//             delegate: SliverChildBuilderDelegate(
//               (context, index) => Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//                 height: 50.0,
//                 child: Text(
//                   "$index",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               childCount: 20,
//             ),
//           ),
//         ],
//       ),
//     );