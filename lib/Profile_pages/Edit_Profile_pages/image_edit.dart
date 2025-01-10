import 'package:flutter/material.dart';

class Image_Edit extends StatelessWidget {
  const Image_Edit({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 60,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/User.png"),
              ),
              Positioned(
                top: 75,
                left: 70,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
