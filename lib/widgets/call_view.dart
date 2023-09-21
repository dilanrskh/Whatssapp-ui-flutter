import 'package:flutter/material.dart';
import 'package:whatsapp_ui/models/call.dart';
import 'package:whatsapp_ui/theme.dart';

class CallView extends StatelessWidget {
  const CallView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: callList.length,
        itemBuilder: (context, index) {
          final status = callList[index];
          return ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 58,
              color: Colors.black,
            ),
            title: Text(
              status.name,
              style: customTextStyle,
            ),
            subtitle: Text(status.callDate),
            trailing: Icon(
              Icons.call,
              color: Colors.green,
            ),
          );
        });
  }
}
