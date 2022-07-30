import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/reminders/views/resin_reminder.dart';
import 'package:little_teyvat/src/shared/scaffolds/basic_scaffold.dart';

class Reminders extends StatelessWidget {
  const Reminders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      title: context.tr.reminders,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const <Widget>[
            ResinReminder(),
          ],
        ),
      ),
    );
  }
}
