import 'package:flutter/material.dart';

class Doubt_CardView extends StatefulWidget {
  const Doubt_CardView({super.key});

  @override
  State<Doubt_CardView> createState() => _Doubt_CardViewState();
}

class _Doubt_CardViewState extends State<Doubt_CardView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Have a doubt?",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        const Text(
          "Use 5 coins to ask Chittoo",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        const Center(
          child: Image(
            image: AssetImage("assets/images/Worried-amico 1.png"),
            fit: BoxFit.fill,
            width: 200,
            height: 200,
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.only(left: 5),
            width: MediaQuery.of(context).size.width - 25,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(fontSize: 13),
                    maxLines: 1,
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(fontSize: 13),
                        border: InputBorder.none,
                        hintText: 'Type your questions here...'),
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.send_sharp)),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
            child: Text(
          "Previous Questions",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: Color(0xFFF57952),
              decorationColor: Color(0xFFF57952)),
        ))
      ],
    );
  }
}
