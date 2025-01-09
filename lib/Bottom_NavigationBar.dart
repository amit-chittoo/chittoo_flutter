import 'package:flutter/material.dart';

class Bottom_NavigationBar extends StatefulWidget {
  final selectedindex;
  final context;

  const Bottom_NavigationBar(
      {super.key, required this.selectedindex, required this.context});

  @override
  State<Bottom_NavigationBar> createState() => _Bottom_NavigationBarState();
}

class _Bottom_NavigationBarState extends State<Bottom_NavigationBar> {
  late int _selectedindex = widget.selectedindex;

  Color _myColor = const Color(0xC7F7F7F7);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: _myColor,
                blurRadius: 30,
                offset: Offset(0, 10))
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              AnimatedContainer(
                width: 10,
                height: 10,
                duration: Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    _selectedindex = 0;
                  });
                },
                icon: widget.selectedindex == 0
                    ? const Icon(
                        color: Colors.orange,
                        Icons.home_filled,
                        size: 25,
                      )
                    : const Icon(
                        Icons.home_outlined,
                        color: Colors.grey,
                        size: 25,
                      ),
              ),
            ],
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                _selectedindex = 1;
              });
            },
            icon: widget.selectedindex == 1
                ? const Icon(
                    Icons.work_rounded,
                    color: Colors.orange,
                    size: 25,
                  )
                : const Icon(
                    Icons.work_outline_outlined,
                    color: Colors.grey,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                _selectedindex = 2;
              });
            },
            icon: _selectedindex == 2
                ? const Icon(
                    Icons.widgets_rounded,
                    color: Colors.orange,
                    size: 25,
                  )
                : const Icon(
                    Icons.widgets_outlined,
                    color: Colors.grey,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                _selectedindex = 3;
              });
            },
            icon: _selectedindex == 3
                ? const Icon(
                    Icons.person,
                    color: Colors.orange,
                    size: 25,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                    size: 25,
                  ),
          ),
        ],
      ),
    );
  }
}
