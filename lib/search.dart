import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'feed.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    const TextStyle linkStyle = TextStyle(fontSize: 14);

    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      TextField(
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1,
                        ),
                        decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Search...',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(15, 20, 15, 10),
                            filled: true,
                            fillColor: const Color(0xFFEAEDEE),
                            hintStyle: TextStyle(height: 1)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 25,
                          bottom: 5,
                        ),
                        child: Row(
                          children: const [
                            Text(
                              "Posts   ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            Text(
                              "Users",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Column(children: const [
                          Post(),
                          Post(),
                          Post(),
                          Post(),
                        ])))
              ],
            ),
          ),
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
