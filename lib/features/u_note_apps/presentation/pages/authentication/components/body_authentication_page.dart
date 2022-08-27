part of '../authentication_page.dart';

class BodyAuthenticationPage extends StatefulWidget {
  const BodyAuthenticationPage({Key? key}) : super(key: key);
  @override
  State<BodyAuthenticationPage> createState() => _BodyAuthenticationPageState();
}

class _BodyAuthenticationPageState extends State<BodyAuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.hallo,
            style: FontApp.primaryStyle
                .copyWith(fontSize: Dimens.dp20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(child: Image.asset(ImageAssets.get(ImageAssets.imgPhone))),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: SizedBox(
              width: 250,
              child: Text(
                Strings.authPageText,
                style:
                    FontApp.primaryStyle.copyWith(fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: CustomElevationButton(
              height: 52,
              width: 300,
              color: ColorApp.primaryColor,
              onTap: () {},
              style: FontApp.primaryStyle.copyWith(color: Colors.white),
              text: Strings.masukDenganGoogle,
            ),
          )
        ],
      ),
    );
  }
}
