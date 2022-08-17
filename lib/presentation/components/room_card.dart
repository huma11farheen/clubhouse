import 'package:clubhouse/data/room.dart';
import 'package:clubhouse/presentation/components/user_profile_image.dart';
import 'package:clubhouse/presentation/pages/room_page.dart';
import 'package:clubhouse/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return RoomScreen(room: room);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
        child: _Card(
          room: room,
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final Room room;

  const _Card({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context).textTheme.overline!.copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
        );

    final subTitleTextStyle = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        );
    final nameTagStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 16.0);
    final totalPeoplePresent = room.speakers.length + room.followedBySpeakers.length + room.others.length;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${room.clubName} 🏠'.toUpperCase(),
              style: titleTextStyle,
            ),
            Text(
              room.description,
              style: subTitleTextStyle,
            ),
            const SizedBox(height: 12.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: _SpeakerImageDisplay(
                      firstSpeakerImageUrl: room.speakers[0].imageUrl,
                      secondSpeakerImageUrl: room.speakers[1].imageUrl,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...room.speakers.map(
                        (e) => Text(
                          '${e.userName} 💬',
                          style: nameTagStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '$totalPeoplePresent ',
                              ),
                              const WidgetSpan(
                                child: Icon(
                                  CupertinoIcons.person_fill,
                                  size: 18.0,
                                  color:Palette.grey,
                                ),
                              ),
                              TextSpan(text: '  ${room.speakers.length} '),
                              const WidgetSpan(
                                child: Icon(
                                  CupertinoIcons.chat_bubble_fill,
                                  size: 18.0,
                                  color: Palette.grey,
                                ),
                              ),
                            ],
                          ),
                          style: TextStyle(color: Palette.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SpeakerImageDisplay extends StatelessWidget {
  const _SpeakerImageDisplay(
      {Key? key,
      required this.firstSpeakerImageUrl,
      required this.secondSpeakerImageUrl})
      : super(key: key);
  final String firstSpeakerImageUrl;
  final String secondSpeakerImageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 30.0,
          top: 20.0,
          child: UserProfileImageContainer(
            imageUrl: firstSpeakerImageUrl,
          ),
        ),
        UserProfileImageContainer(
          imageUrl: secondSpeakerImageUrl,
        ),
      ],
    );
  }
}
