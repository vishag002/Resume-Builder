import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder/controller/theme_controller.dart';
import 'package:resume_builder/view/data%20screens/resume_data_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("resume Builder"),
        actions: [
          IconButton(
              onPressed: () {
                final themeProvider =
                    Provider.of<ThemeProvider>(context, listen: false);
                themeProvider.toggleTheme(context);
              },
              icon: Icon(Icons.brightness_4_outlined))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(ResumeDataScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
