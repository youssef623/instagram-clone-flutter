import 'package:flutter/material.dart';
import 'package:instagram/models/post.model.dart';

class FriendStory extends StatelessWidget
{
  const FriendStory({super.key, required this.watched, required this.post});
  final bool watched;
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
                  padding: const EdgeInsets.all(2), // Space for the border
                  decoration: watched?  const BoxDecoration(
                    shape: BoxShape.circle, // Circle shape for outer border
                    color: Colors.grey,
                  ) :  
                  const BoxDecoration(
                    shape: BoxShape.circle, // Circle shape for outer border
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
                    padding:
                        const EdgeInsets.all(2), // Space between image and border
                    decoration: const BoxDecoration(
                      color: Colors.white, // Inner circle color
                      shape: BoxShape.circle, // Ensuring it's a circle
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(50), // Circular image border
                      child: Image.asset(
                        post.profilePic,
                        width: 80, // Increased width
                        height: 80, // Increased height
                      ),
                    ),
                  ),
                ),
    );
  }
  
}