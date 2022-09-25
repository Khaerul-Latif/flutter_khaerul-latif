import 'dart:io';

import 'package:flutter/material.dart';

class PreviewPost extends StatefulWidget {
  final String image;
  final String time;
  final Color currentColor;
  final TextEditingController controller;

  const PreviewPost(
      {Key? key,
      required this.image,
      required this.time,
      required this.currentColor,
      required this.controller})
      : super(key: key);

  @override
  State<PreviewPost> createState() => _PreviewPostState();
}

class _PreviewPostState extends State<PreviewPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text("Preview Post"),
      ),
      drawer: const Drawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.file(File(widget.image)),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text('Published: ${widget.time}',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 95, 92, 92)))),
                const Text(
                  "Color",
                  style: TextStyle(color: Color.fromARGB(255, 95, 92, 92)),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: widget.currentColor,
                      borderRadius: BorderRadius.circular(100),
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              widget.controller.text,
              style: const TextStyle(
                color: Color.fromARGB(255, 95, 92, 92),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
