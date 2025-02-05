import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 53,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          onPressed: onPressed,
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF192B85),
                  Color(0xFF9D48CE),
                ],
              ),
              borderRadius: BorderRadius.circular(45),
            ),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16),
              constraints: BoxConstraints.expand(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      fontFamily: "ProximaNova",
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
