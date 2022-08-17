import 'package:clubhouse/data/room.dart';
import 'package:clubhouse/presentation/components/room_user_profile.dart';
import 'package:clubhouse/data/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 60.0,
          leading: const Icon(CupertinoIcons.chevron_down),
          actions: [
            GestureDetector(
              onTap: (){
                Navigator.pop;
              },
              child: Row(
                children: const [
                  Text(
                    'Leave quietly',
                    style: TextStyle(color: Colors.red),
                  ),
                  Icon(CupertinoIcons.hand_raised)
                ],
              ),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: CustomScrollView(
            slivers: [
              _RoomInformation(room: room),
              _PeopleSliverGrid(users: room.speakers),
              const _PeopleGroupTitle(title: 'Followed by speakers'),
              _PeopleSliverGrid(users: room.followedBySpeakers),
              const _PeopleGroupTitle(title: 'Others in room'),
              _PeopleSliverGrid(users: room.others),
              const SliverPadding(padding: EdgeInsets.only(bottom: 100.0)),
            ],
          ),
        ),
        bottomSheet: _BottomSheet());
  }
}

class _PeopleSliverGrid extends StatelessWidget {
  const _PeopleSliverGrid({Key? key, required this.users}) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverGrid.count(
        mainAxisSpacing: 20.0,
        crossAxisCount: 4,
        childAspectRatio: 0.7,
        children: users
            .map(
              (user) => RoomUserProfile(
                imageUrl: user.imageUrl,
                name: user.userName,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _PeopleGroupTitle extends StatelessWidget {
  const _PeopleGroupTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

class _RoomInformation extends StatelessWidget {
  const _RoomInformation({Key? key, required this.room}) : super(key: key);
  final Room room;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.overline!.copyWith(
          fontSize: 14.0,
          letterSpacing: 1.0,
        );
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${room.clubName} 🏠'.toUpperCase(),
                style: textStyle,
              ),
            ],
          ),
          Text(
            room.description,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
          ),
        ],
      ),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 12.0,
      ),
      height: 96.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              _IconContainer(
                children: [Icon(CupertinoIcons.chat_bubble_text), Text('Chat')],
              ),
              SizedBox(
                width: 16,
              ),
              _IconContainer(
                children: [Icon(CupertinoIcons.share), Text('Share')],
              )
            ],
          ),
          const _IconContainer(
            children: [Icon(CupertinoIcons.hand_raised)],
          )
        ],
      ),
    );
  }
}

class _IconContainer extends StatelessWidget {
  const _IconContainer({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Row(
        children: [
          ...children.map(
            (child) => Padding(
              padding: const EdgeInsets.only(left: 4),
              child: child,
            ),
          )
        ],
      ),
    );
  }
}
