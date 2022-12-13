import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostData extends StatefulWidget {
  final title, user, detail, addTime;
  const PostData({
    super.key,
    //required this.post,
    required this.title,
    required this.user,
    required this.detail,
    required this.addTime,
  });

  //final PostModel post;

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  //final PostController _postController = PostController();
  bool likedPost = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.user.username,
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
          Text(
            widget.detail,
            style: GoogleFonts.poppins(
              fontSize: 12,
            ),
          ),
          Text(
            widget.addTime,
            style: GoogleFonts.poppins(
              fontSize: 12,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.comment),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
