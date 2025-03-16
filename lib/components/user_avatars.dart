import 'package:flutter/material.dart';

class UserAvatars extends StatelessWidget {
  const UserAvatars({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 115,
          height: 45,
          child: Stack(
            children: [
              ...List.generate(
                4,
                (index) => Positioned(
                  left: index * 20,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'images/user_${index + 1}.png',
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ).reversed.toList(),
              Positioned(
                right: 0,
                top: 6,
                child: CircleAvatar(
                    backgroundColor: Color(0xffAB29FF),
                    radius: 15,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
