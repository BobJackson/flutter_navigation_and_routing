import 'package:flutter/material.dart';

import '../routing/route_state.dart';
import '../widgets/fade_transition_page.dart';
import 'authors.dart';
import 'books.dart';
import 'settings.dart';

class BookstoreScaffoldBody extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  const BookstoreScaffoldBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var currentRoute = RouteStateScope.of(context).route;
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, dynamic result) => route.didPop(result),
      pages: [
        if (currentRoute.pathTemplate.startsWith('/authors'))
          const FadeTransitionPage<void>(
              child: AuthorsScreen(), key: ValueKey('authors'))
        else if (currentRoute.pathTemplate.startsWith('/settings'))
          const FadeTransitionPage<void>(
              child: SettingsScreen(), key: ValueKey('settings'))
        else if (currentRoute.pathTemplate.startsWith('/books') ||
            currentRoute.pathTemplate == '/')
          const FadeTransitionPage<void>(
              child: BooksScreen(), key: ValueKey('books'))
        else
          FadeTransitionPage<void>(
              child: Container(), key: const ValueKey('empty'))
      ],
    );
  }
}
