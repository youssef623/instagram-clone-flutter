import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/constants.dart';
import 'package:instagram/post.dart';
import 'package:instagram/stories_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true, // Makes the app bar float and disappear on scroll
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/Logo dropdown.svg'),
                    SvgPicture.asset('assets/Icons.svg'),
                  ],
                ),
              ),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0) {
                  // First item is the StoriesSection
                  return Column(
                    children: [
                      const StoriesSection(),
                      Container(
                        height: 0.1,
                        color: Colors.grey,
                        width: double.infinity,
                        
                      ),
                    ],
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: PostView(post: posts[index],), // Your Post widget
                );
              },
              childCount: posts.length, // Number of items including StoriesSection
            ),
          ),
        ],
      ),
    );
  }
}
