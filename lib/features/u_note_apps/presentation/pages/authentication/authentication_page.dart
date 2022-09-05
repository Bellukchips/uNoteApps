import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:resource/resource.dart';
import 'package:u_note_apps/features/u_note_apps/presentation/cubits/cubits.dart';
import 'package:u_note_apps/shared/shared.dart';
part 'components/body_authentication_page.dart';
part 'components/background_authentication_page.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: AuthenticationPage());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: BackgroundAuthenticationPage(
        child: BodyAuthenticationPage(),
      )),
    );
  }
}
