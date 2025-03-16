import 'package:flutter/material.dart';

class BookingSelection extends StatelessWidget {
  const BookingSelection({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });
  final String image;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 170,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF192B85),
                Color(0xFF9D48CE),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned(
          top: -30,
          left: 0,
          right: 0,
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  image,
                  width: 200,
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: Center(
                        child: Text(
                          "Book Now",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
