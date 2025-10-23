import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'utils/app_colors.dart';
import 'utils/app_strings.dart';
import 'utils/route_generator.dart';
import 'utils/screen_bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: kWhiteColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      scaffoldBackgroundColor: kWhiteColor,
      colorScheme: ThemeData().colorScheme.copyWith(primary: kPrimaryColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return ScreenUtilInit(
          designSize: const Size(1440, 1024),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
              theme: _buildTheme(Brightness.light),
              title: 'Nail Connect Admin',
              debugShowCheckedModeBanner: false,
              initialBinding: ScreenBindings(),
              initialRoute: kLoginScreenRoute,
              getPages: RouteGenerator.getPages(),
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: MediaQuery.of(context).textScaler.clamp(
                      minScaleFactor: 1.0,
                      maxScaleFactor: 1.0,
                    ),
                  ),
                  child: child!,
                );
              },
            );
          },
        );
      },
    );
  }
}
