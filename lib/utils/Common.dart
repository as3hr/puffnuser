import 'package:flutter/material.dart';

Widget dotIndicator(list, i) {
  return SizedBox(
    height: 16,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        list.length,
        (ind) {
          final isActive = i == ind;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 8,
              width: isActive ? 24 : 8,
              decoration: BoxDecoration(
                color: isActive ? Color(0xffFF532D) : Color(0xffBA24D5),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          );
        },
      ),
    ),
  );
}

List<T> parseList<T>(
  data,
  T Function(Map<String, dynamic>) fromJson,
) {
  final parsedData = (data as List?)?.cast<Map<String, dynamic>>();
  return parsedData?.map(fromJson).toList().cast<T>() ?? [];
}
