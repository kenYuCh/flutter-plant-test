import 'package:flutter/material.dart';

Widget buildListView(_controller) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const ScrollPhysics(),
    itemExtent: 50.0,
    itemCount: 40,
    controller: _controller,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.amber,
              child: Text("asd",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            SizedBox(width: 50.0),
            Container(
              child: Text("asd",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            Spacer(),
            Container(
              child: Text("asd",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      );
    },
  );
}
