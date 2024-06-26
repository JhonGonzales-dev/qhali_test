import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:qhali_app/controller/user_cubit.dart';
import 'routes/app_routes.dart';
import 'injector.dart' as di;
import 'utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GetIt.instance<UserCubit>()),
        ],
        child: MaterialApp.router(
          title: 'QHALI',
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoute.router,
          theme: AppTheme.themeData(context),
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1)),
              child: widget!,
            );
          },
        ));
  }
}
