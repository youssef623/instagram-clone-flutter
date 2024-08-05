import 'package:flutter/material.dart';
import 'package:instagram/constants.dart';
import 'package:instagram/friend_story.dart';


class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 0, 11),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      /*padding: const EdgeInsets.all(3), // Space for the border
                    decoration: const BoxDecoration(
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
                    ),*/
                      child: Container(
                        padding: const EdgeInsets.all(
                            3), // Space between image and border
                        decoration: const BoxDecoration(
                          color: Colors.white, // Inner circle color
                          shape: BoxShape.circle, // Ensuring it's a circle
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              50), // Circular image border
                          child: Image.asset(
                            fit: BoxFit
                                .cover, // Make sure it covers the container

                            'assets/1_1.png',
                            width: 80, // Increased width
                            height: 80, // Increased height
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 60,
                      child: Image.asset(
                        'assets/Round.png',
                        width: 24, // Width of the overlay image
                        height: 24, // Height of the overlay image
                      ),
                    ),
                  ],
                ),
                Row(
                  children: posts.map((post) {
                    return FriendStory(
                      watched: false,
                      post: post,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
