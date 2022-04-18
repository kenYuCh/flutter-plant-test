import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:plant_iot_app2/screen/device/components/ItemChart.dart';
import 'package:plant_iot_app2/screen/home/components/ListDevice.dart';
import 'package:plant_iot_app2/screen/home/components/searchTextBox.dart';
import 'package:sticky_headers/sticky_headers.dart';

class DeviceBody extends StatefulWidget {
  const DeviceBody({Key? key}) : super(key: key);

  @override
  _DeviceBodyState createState() => _DeviceBodyState();
}

class _DeviceBodyState extends State<DeviceBody> {
  List<bool> isExpanded = [false, false, false, false, false];
  ScrollController _controller = ScrollController();
  // only run once
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      // print(_controller.offset);
      // if (_controller.offset > 300 && isExpanded[0]) {
      //   setState(() {
      //     isExpanded[0] = false;
      //   });
      // }
    });
  }

  @override
  void didChangeDependecies() {
    super.didChangeDependencies;
    print("didChangeDependecies");
  }

  void setExpaned(value, index) {
    print("value: $value"); // true
    setState(() {
      isExpanded[index] = value;
    });
    print(isExpanded[0]); // <- false
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
    print("dispose1");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      controller: _controller,
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: false,
          snap: false,
          backgroundColor: Colors.black,
          title: SearchTextBox(),
          // automaticallyImplyLeading: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            StickyHeader(
              header: ExpansionTile(
                leading: const Icon(Icons.star_border),
                textColor: Colors.white,
                collapsedTextColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                collapsedBackgroundColor: Color.fromARGB(255, 0, 0, 0),
                iconColor: Colors.white,
                collapsedIconColor: Colors.white,
                title: Text("Title1"),
                initiallyExpanded: isExpanded[0],
                onExpansionChanged: (value) {
                  setExpaned(value, 0);
                },
                children: [],
              ),
              content: AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                firstChild: Container(
                  height: size.height * 0.65,
                  child: ListView.builder(
                    itemCount: catagory.length,
                    itemExtent: 100.0,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      print("listview: $index");
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              constraints:
                                  BoxConstraints(maxWidth: double.infinity),
                              alignment: Alignment.center,
                              child: catagory[index].icons,
                            ),
                            Expanded(
                              child: BuildChart(),
                            ),
                            Container(
                              child: Text(
                                "${catagory[index].temp}",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                secondChild: Container(),
                crossFadeState: isExpanded[0]
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
            StickyHeader(
              header: ExpansionTile(
                leading: const Icon(Icons.star_border),
                textColor: Colors.white,
                collapsedTextColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                collapsedBackgroundColor: Color.fromARGB(255, 0, 0, 0),
                iconColor: Colors.white,
                collapsedIconColor: Colors.white,
                title: Text("Title2"),
                onExpansionChanged: (value) {
                  setExpaned(value, 1);
                },
                children: [],
              ),
              content: AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                firstChild: ListView.builder(
                  itemCount: 10,
                  itemExtent: 50.0,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    child: Text(
                      "asdasdads1111111",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                secondChild: Container(),
                crossFadeState: isExpanded[1]
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
          ]),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
            childCount: 25,
          ),
        )
      ],
    );
  }
}

class DeviceItem {
  final int id;
  final Icon icons;
  final String name;
  final double temp;
  List<double> deviceChartData;
  DeviceItem(this.id, this.icons, this.name, this.temp, this.deviceChartData) {
    assert(id != null, "A msg ID is required.");
    assert(name != null, "Msg name is required.");
    assert(temp != null, "Msg temp is required.");
    assert(deviceChartData != null, "Msg temp is required.");
  }
}

class DeviceItemChart {
  List<double> deviceItem;
  DeviceItemChart({required this.deviceItem});
}

List<DeviceItem> catagory = [
  DeviceItem(
      1,
      Icon(
        Icons.device_thermostat_outlined,
        color: Colors.white,
      ),
      "name1",
      50.10,
      []),
  DeviceItem(
      2,
      Icon(
        Icons.device_thermostat_outlined,
        color: Colors.white,
      ),
      "name2",
      55.10,
      []),
];









// content: AnimatedCrossFade(
//   duration: const Duration(milliseconds: 300),
//   firstChild: Container(
//     height: size.height * 0.99,
//     child: ListView.builder(
//       itemCount: 30,
//       itemExtent: 100.0,
//       shrinkWrap: true,
//       physics: ScrollPhysics(),
//       itemBuilder: (context, index) {
//         print("listview: $index");
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Container(
//               constraints:
//                   BoxConstraints(maxWidth: double.infinity),
//               alignment: Alignment.center,
//               child: Text(
//                 "temp",
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             Container(
//               child: Text(
//                 "content",
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             Container(
//               child: Text(
//                 "ster",
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             )
//           ],
//         );
//       },
//     ),
//   ),
//   secondChild: Container(),
//   crossFadeState: isExpanded[0]
//       ? CrossFadeState.showFirst
//       : CrossFadeState.showSecond,
// ),