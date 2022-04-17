import 'package:flutter/material.dart';

class SearchTextBox extends StatefulWidget {
  const SearchTextBox({Key? key}) : super(key: key);

  @override
  _SearchTextBoxState createState() => _SearchTextBoxState();
}

class _SearchTextBoxState extends State<SearchTextBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 34,
      decoration: BoxDecoration(
        color: const Color.fromARGB(78, 82, 82, 82), // Box-BackgroundColor
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          // BoxShadow(
          //   offset: const Offset(0, 10),
          //   blurRadius: 50,
          //   color: Colors.black.withOpacity(0.23),
          // ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            // Search Text style
            child: TextField(
              style: const TextStyle(color: Colors.white), // font color
              cursorColor: Colors.white,
              onChanged: (value) {
                print(value);
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            splashColor: Colors.black,
            highlightColor: Colors.black,
            onPressed: (() => print("btn")),
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 24.0,
            ),
          )
        ],
      ),
    );
  }
}
