import 'package:flutter/material.dart';

class PostFIeld extends StatelessWidget {
  const PostFIeld({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Tulis Pertanyaan...',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            )),
      ),
    );
  }
}
