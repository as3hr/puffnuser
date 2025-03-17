import 'package:flutter/material.dart';

class SubmissionButton extends StatelessWidget {
  const SubmissionButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
  });
  final VoidCallback onTap;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 53,
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
          borderRadius: BorderRadius.circular(45),
        ),
        child: Center(
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
