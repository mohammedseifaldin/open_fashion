import 'package:flutter_bloc/flutter_bloc.dart';

import 'sources/hive_helper.dart';
import 'sources/shared_preferences.dart';
import 'utilities/bloc_observer.dart';
import 'utilities/service_locator.dart';

Future<void> initServicess() async {
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  await Future.wait([
    AppSp.init(),
    HiveHelper.init(),
  ]);
}
