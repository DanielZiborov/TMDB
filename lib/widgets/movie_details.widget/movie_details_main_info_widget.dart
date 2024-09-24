import 'package:flutter/material.dart';
import 'package:themoviedb/elements/radial_percent_widget.dart';
import 'package:themoviedb/resourses/app_images.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _TopPosterWidget(),
        const Padding(
          padding: EdgeInsets.all(20),
          child: _MovieNameWidget(),
        ),
        const _ScoreWidget(),
        const _SummeryWidget(),
        Padding(
          padding: const EdgeInsets.all(10),
          child: _owerviewWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: _descriptionWidget(),
        ),
        const SizedBox(height: 30),
        const _PeopleWidget(),
      ],
    );
  }

  Text _descriptionWidget() {
    return const Text(
      'The Tower is a place where willpower is tested and the most incredible desires are fulfilled. If the Tower has chosen you, conquer it. And then wealth, power, strength - whatever you wish for will be yours. However, conquest may take years, if not centuries. Are you ready to conquer the Tower?',
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
    );
  }

  Text _owerviewWidget() {
    return const Text(
      'Review',
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.topHeader,
        ),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: Image.asset(
            AppImages.topHeaderSubImage,
          ),
        ),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: const TextSpan(children: [
        TextSpan(
          text: 'The tower of God 2',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 21,
          ),
        ),
        TextSpan(
          text: ' (2024)',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ]),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: const Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: RadialPercentWidget(
                  percent: 0.83,
                  fillColor: Colors.black,
                  lineColor: Colors.green,
                  lineWidth: 5,
                  freeColor: Colors.yellow,
                  child: Text('83%'),
                ),
              ),
              SizedBox(width: 10),
              Text('User Score'),
            ],
          ),
        ),
        Container(color: Colors.grey, width: 1, height: 15),
        TextButton(
          onPressed: () {},
          child: const Row(
            children: [
              Icon(Icons.play_arrow),
              Text('Play Trailer'),
            ],
          ),
        ),
      ],
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          maxLines: 3,
          textAlign: TextAlign.center,
          'TV-14 cartoon ,  detective ,  sci-fi and fantasy ,  action and adventure',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const nameStyle = TextStyle(
      color: Colors.white,
      fontSize: 15,
    );
    const jobTitleStyle = TextStyle(
      color: Colors.white,
      fontSize: 15,
    );

    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SIU',
                  style: nameStyle,
                ),
                Text(
                  'manhwa',
                  style: jobTitleStyle,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SIU',
                  style: nameStyle,
                ),
                Text(
                  'manhwa',
                  style: jobTitleStyle,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SIU',
                  style: nameStyle,
                ),
                Text(
                  'manhwa',
                  style: jobTitleStyle,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SIU',
                  style: nameStyle,
                ),
                Text(
                  'manhwa',
                  style: jobTitleStyle,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
