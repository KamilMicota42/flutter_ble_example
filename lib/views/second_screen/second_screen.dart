import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';
import '../../utils/methods/show_snack_bar.dart';
import '../../utils/methods/validators.dart';

@RoutePage()
class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('helloWorld'.tr()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                context.setLocale(const Locale('en'));
              },
              child: const Text(
                'change lang: en',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.setLocale(const Locale('pl'));
              },
              child: const Text(
                'change lang: pl',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                showSnackBar(Validators.validateEmail("test") ?? "null");
              },
              child: const Text(
                'Test locale without context',
              ),
            ),
            SvgPicture.asset(
              Assets.lib.assets.icons.facebook,
              height: 24,
            ),
            Image.asset(
              Assets.lib.assets.images.sample.path,
            ),
          ],
        ),
      ),
    );
  }
}
