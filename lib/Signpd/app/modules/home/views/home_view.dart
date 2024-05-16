import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:signio/Signpd/app/data/sample/sample_document.dart';
import 'package:signio/App_pages.dart';
import 'package:signio/components/SignatureBanner.dart';

import '../../../../../general_home_page/components/CashbackBanner.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  static String routeName = "/home";

  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Using a bigger font size for the title
        title: Text(
          'Sign your Documents',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        // Adding back arrow button
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          SignatureBanner(), // Add the SignatureBanner widget here
          SizedBox(height: 20), // Add some spacing between the banner and the title
          Text(
            'Received Documents',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider( // Add a black line (Divider) below the "Received Documents" title
            color: Colors.black,
            thickness: 1.0,
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listSampleDocument.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.description),
                  title: Text(listSampleDocument[index].title),
                  subtitle: Text(DateFormat("dd MMM yyy HH:mm:ss").format(listSampleDocument[index].created)),
                  onTap: () => Get.toNamed(Routes.VIEW_DOCUMENT, arguments: listSampleDocument[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
