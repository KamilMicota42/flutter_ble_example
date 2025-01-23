import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import '../../views/home/home_screen.dart';
import '../../views/second_screen/second_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
@lazySingleton
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: SecondRoute.page),
      ];
}
