import 'package:flutter/material.dart';

class UserProfileImageContainer extends StatelessWidget {
  final String imageUrl;

  const UserProfileImageContainer({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        height: 48,
        width: 48,
        fit: BoxFit.cover,
      ),
    );
  }
}
