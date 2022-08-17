import 'dart:math';

import 'package:clubhouse/data/room.dart';
import 'package:clubhouse/domain/users_controller.dart';

final List<Room> roomsList = [
  Room(
    clubName: 'The Roosevelt',
    description: 'Clubhouse : WarZone Edition',
    speakers: List.generate(5, (_) => allUsers[Random().nextInt(allUsers.length)]).toSet().toList(),
    followedBySpeakers: List.generate(6, (_) => allUsers[Random().nextInt(allUsers.length)]).toSet().toList(),
    others: List.generate(4, (_) => allUsers[Random().nextInt(allUsers.length)]).toSet().toList(),
  ),
  Room(
    clubName: 'Strategy First',
    description: 'Should you create a house on Clubhouse? Lets talk stategy',
    speakers: List.generate(5, (_) => allUsers[Random().nextInt(allUsers.length)]).toSet().toList(),
    followedBySpeakers: List.generate(5, (_) => allUsers[Random().nextInt(allUsers.length)]).toSet().toList(),
    others: List.generate(5, (_) => allUsers[Random().nextInt(allUsers.length)]).toSet().toList(),
  ),
  Room(
    clubName: 'Wealths MasterMinds',
    description: 'Launch and hold 💰, Buy and hold statergies for wealth',
    speakers: List.generate(5, (_) => allUsers[Random().nextInt(allUsers.length)]).toSet().toList(),
    followedBySpeakers: List.generate(5, (_) => allUsers[Random().nextInt(allUsers.length)]).toSet().toList(),
    others: List.generate(5, (_) => allUsers[Random().nextInt(allUsers.length)]).toSet().toList(),
  ),
  Room(
    clubName: 'The Mortgage Syndicate',
    description: 'Be the bank , start in real estate. No funds/License/Exp req',
    speakers: List.generate(5, (_) => allUsers[Random().nextInt(allUsers.length)]).toSet().toList(),
    followedBySpeakers: List.generate(5, (_) => allUsers[Random().nextInt(allUsers.length)]).toSet().toList(),
    others: List.generate(5, (_) => allUsers[Random().nextInt(allUsers.length)]).toSet().toList(),
  ),
  Room(
    clubName: 'OG Club',
    description: 'Learn from Owwll Experts how to Monetize your Expertise on',
    speakers: List.generate(5, (_) => allUsers[Random().nextInt(allUsers.length)]).toSet().toList(),
    followedBySpeakers: List.generate(5, (_) => allUsers[Random().nextInt(allUsers.length)]).toSet().toList(),
    others: List.generate(5, (_) => allUsers[Random().nextInt(allUsers.length)]).toSet().toList(),
  ),
];

