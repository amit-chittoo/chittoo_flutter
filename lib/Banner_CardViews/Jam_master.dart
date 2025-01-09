import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Jam_master_banner extends StatefulWidget {
  const Jam_master_banner({super.key});

  @override
  State<Jam_master_banner> createState() => _Jam_master_bannerState();
}

class _Jam_master_bannerState extends State<Jam_master_banner> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 10),
        width: MediaQuery.of(context).size.width - 20,
        height: 150,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                elevation: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFFFBFDCD),
                  ),
                  width: MediaQuery.of(context).size.width - 50,
                  height: 80,
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "JAM Masters",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Euclid Circular",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Discover inspiring speeches",
                              softWrap: true,
                              style: TextStyle(
                                  fontFamily: "Euclid Circular",
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100),
                            ),
                          ],
                        ),

                        // SizedBox(width:150),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.play_circle,
                            color: Color(0xFFF57952),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SvgPicture.asset(
                "Images/Banners_img/jam_master_icon.svg",
                fit: BoxFit.fill,
                width: 100,
                height: 110,
              ),
            )
          ],
        ),
      ),
    );
  }
}
