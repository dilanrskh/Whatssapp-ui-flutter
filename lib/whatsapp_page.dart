import 'package:flutter/material.dart';
import 'package:whatsapp_ui/theme.dart';

class WhatsAppPage extends StatefulWidget {
  const WhatsAppPage({super.key});

  @override
  State<WhatsAppPage> createState() => _WhatsAppPageState();
}

class _WhatsAppPageState extends State<WhatsAppPage>
    with SingleTickerProviderStateMixin {
  var tabs = const [
    Tab(
      icon: Icon(Icons.camera_alt),
    ),
    Tab(
      text: "Chat",
    ),
    Tab(
      text: "Status",
    ),
    Tab(
      text: "Calls",
    ),
  ];

  TabController? tabController;

  IconData fabIcon = Icons.message;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
    tabController?.addListener(() {
      setState(() {
        switch (tabController?.index) {
          case 0:
            fabIcon = Icons.camera_alt;
            break;
          case 1:
            fabIcon = Icons.message;
            break;
          case 2:
            fabIcon = Icons.camera;
            break;
          case 3:
            fabIcon = Icons.call;
            break;
          default:
        }
      });
    });
    tabController?.index = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp"),
        backgroundColor: whatsAppGreen,
        bottom: TabBar(
          tabs: tabs,
          controller: tabController,
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          // Camera
          Center(
            child: Icon(Icons.camera_alt),
          ),

          // Chat
          Container(),

          // Status
          StatusView(),

          // Calls
          Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(fabIcon),
        backgroundColor: whatsAppLightGreen,
      ),
    );
  }
}
