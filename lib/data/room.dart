import 'package:clubhouse/data/user.dart';

class Room {
  final String clubName;
  final String description;
  final List<User> speakers;
  final List<User> followedBySpeakers;
  final List<User> others;

  const Room({
    required this.clubName,
    required this.description,
    this.speakers = const [],
    this.followedBySpeakers = const [],
    this.others = const [],
  });
}