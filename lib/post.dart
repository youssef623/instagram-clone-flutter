import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/commets_section.dart';
import 'package:instagram/models/post.model.dart';

class PostView extends StatefulWidget {
  const PostView({super.key, required this.post});

  final Post post;

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  bool isLiked = false; // Track the state of the heart icon
  void _openCommentsSection()
  {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const CommetsSection(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(13, 7, 25, 7),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(1.5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(115, 0, 228, 1.0),
                      Color.fromRGBO(227, 0, 164, 1.0),
                      Color.fromRGBO(255, 183, 99, 1.0),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(1.5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      widget.post.profilePic,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(6, 11, 0, 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.userName,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SvgPicture.asset('assets/3Dots.svg')
            ],
          ),
        ),
        Image.asset(
          widget.post.post,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 13, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLiked = !isLiked; // Toggle the like state
                  });
                },
                child: SvgPicture.asset(
                  isLiked ? 'assets/HeartLike.svg' : 'assets/Heart.svg', // Change icon based on state
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: _openCommentsSection,
                child: SvgPicture.asset(
                  'assets/Comment.svg'
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              SvgPicture.asset(
                'assets/share.svg',
              ),
              const Spacer(),
              Image.asset('assets/Save.png'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 6),
          child: Text(
            '${widget.post.likes.toString()} Likes',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.post.userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: '  ${widget.post.caption}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'View all ${widget.post.comments} comments',
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
