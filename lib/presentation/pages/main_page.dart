import 'package:clubhouse/domain/rooms_controller.dart';
import 'package:clubhouse/presentation/components/room_card.dart';
import 'package:clubhouse/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _IconButton extends StatelessWidget {
  const _IconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: 24,
      ),
      onPressed: onPressed,
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
             Text(
              'Clubhouse',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            )
          ],
        ),
        leadingWidth: 200,
        centerTitle: true,
        actions: [
          _IconButton(
            icon: CupertinoIcons.mail,
            onPressed: () {},
          ),
          _IconButton(
            icon: CupertinoIcons.bell,
            onPressed: () {},
          ),
          _IconButton(
            icon: Icons.share,
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: const EdgeInsets.only(top: 20.0, bottom: 120),
            children: [
              const SizedBox(height: 16.0),
              ...roomsList.map((room) => RoomCard(room: room)),
            ],
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _BottomShadow(),
          ),
          const Positioned(
            bottom: 60.0,
            child: _RoomButton(),
          ),
        ],
      ),
    );
  }
}

class _BottomShadow extends StatelessWidget {
  const _BottomShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
      ),
    );
  }
}

class _RoomButton extends StatelessWidget {
  const _RoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Palette.lightGreen,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: const Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              child: Icon(
                CupertinoIcons.add,
                size: 21.0,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: 'Room',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
