part of '../authentication_page.dart';

class BackgroundAuthenticationPage extends StatelessWidget {
  const BackgroundAuthenticationPage({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(ImageAssets.get(ImageAssets.imgAtas)),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(ImageAssets.get(ImageAssets.imgBawah)),
          ),
          child!
        ],
      ),
    );
  }
}
