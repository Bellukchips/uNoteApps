// ignore_for_file: avoid_unnecessary_containers

part of '../intro_pages.dart';

class IntroContent extends StatelessWidget {
  const IntroContent({Key? key, this.image, this.subtitle}) : super(key: key);
  final String? image;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              width: 245,
              height: 200,
              child: Image.asset(image!),
            ),
          ),
          Container(
            width: 350,
            margin: const EdgeInsets.only(top: 20),
            child: H1Atm(
              subtitle!,
              style: FontApp.primaryStyle.copyWith(
                fontSize: Dimens.dp16,
              ),
              align: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
