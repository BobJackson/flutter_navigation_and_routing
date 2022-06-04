import 'package:flutter/material.dart';
import 'package:flutter_navigation_and_routing/src/auth.dart';
import 'package:url_launcher/link.dart';

import '../routing/route_state.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: const Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                    child: SettingsContent(),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

class SettingsContent extends StatelessWidget {
  const SettingsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          ...[
            Text(
              'Settings',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(onPressed: () {
              BookstoreAuthScope.of(context).signOut();
            }, child: const Text('Sign out')),
            Link(
              uri: Uri.parse('/book/0'),
              builder: (context, followLink) => TextButton(
                  onPressed: followLink,
                  child: const Text('Go directly to /book/0 (Link)')),
            ),
            TextButton(
              onPressed: () {
                RouteStateScope.of(context).go('/book/0');
              },
              child: const Text('Go directly to /book/0 (RouteState)'),
            )
          ].map((w) => Padding(padding: const EdgeInsets.all(8), child: w)),
          TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Alert!'),
                content: const Text('The alert description goes here.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'Ok'),
                      child: const Text('Ok')),
                ],
              ),
            ),
            child: const Text('Show Dialog'),
          )
        ],
      );
}
