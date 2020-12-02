import 'package:bluedog_client/common/theme/theme.dart' as rta_theme;
import 'package:bluedog_client/common/widgets/app/app_scaffold.dart';
import 'package:bluedog_client/common/widgets/keyboard_dismisser.dart';
import 'package:bluedog_client/vehicles/vehicles_screen.dart';
import 'package:flutter/material.dart';

/*
    TODO: Can elastic search or Algolia stream data?
    TODO: Can dynamo stream data?
    TODO: Backlog...
      - Navigator v2
      - Database integration
      - Stream database
      - Auto-save
      - Search
      - Filter
      - Infinite scroll
      - State notifier
      - Implement states
      - Status bar (e.g. saving, syncing, etc.)
      - Environment variables
      - Localize strings
 */

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: rta_theme.buildTheme(context),
      builder: (context, child) => AppScaffold(
        body: child,
      ),
      home: KeyboardDismisser(
        child: VehiclesScreen(),
        // child: ContactsScreen(),
      ),
    );

    // TODO: Device preview is broken on beta channel due to Flutter's null-safety feature (https://github.com/aloisdeniel/flutter_device_preview/issues/74)
    // return DevicePreview(
    //   enabled: DebugUtils.isDebug(),
    //   builder: (context) => MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     locale: DevicePreview.locale(context),
    //     // TODO: Need to inject AppScaffold for responsiveness
    //     builder: DevicePreview.appBuilder,
    //     home: KeyboardDismisser(
    //       child: VehiclesScreen(),
    //     ),
    //   ),
    // );
  }
}
