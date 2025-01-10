import 'package:flutter/material.dart';

class Topic_ListView extends StatefulWidget {
  const Topic_ListView({super.key});

  @override
  State<Topic_ListView> createState() => _Topic_ListViewState();
}

class _Topic_ListViewState extends State<Topic_ListView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "",
              width: 220,
              fit: BoxFit.fill,
              height: 140,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFF57952),
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Center(
                    child: Text(
                  'Error loading \nimage',
                  softWrap: true,
                  textAlign: TextAlign.center,
                ));
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  width: 80,
                  height: 23,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFFF57952)),
                  child: Center(
                      child: Text(
                    "FriendShip",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  )),
                ),
                Text(
                  "Friendship Chat",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage("assets/images/conis.png"),
                      width: 10,
                    ),
                    Text(
                      "Coins",
                      style: TextStyle(fontSize: 8),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.group,
                      size: 15,
                    ),
                    Text(
                      " 1000 students enrolled",
                      style: TextStyle(fontSize: 8),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 30,
              child: FilledButton(
                onPressed: () {},
                child: Text("Unlock"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFDCB02)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
