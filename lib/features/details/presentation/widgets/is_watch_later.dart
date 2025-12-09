import 'package:flutter/material.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({super.key});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      right: 10,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isBookmarked = !isBookmarked;
          });
        },
        child: Icon(
          isBookmarked ? Icons.bookmark : Icons.bookmark_border,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
