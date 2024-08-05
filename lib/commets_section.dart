import 'package:flutter/material.dart';

class CommetsSection extends StatelessWidget {
  const CommetsSection({super.key});

  @override
  Widget build(BuildContext context) {
        final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height-100,
      width: double.infinity,
      child: Text('asd'),
    );
  }
}
