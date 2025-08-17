import 'package:stacked/stacked_annotations.dart';
import 'package:stagged_app/UI/Counter/counter_view.dart';
import 'package:stagged_app/UI/Home%20Sreen/homescreen_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: CounterView),
    MaterialRoute(page: HomeView),
  ],
  dependencies: [],
)
class App {}
