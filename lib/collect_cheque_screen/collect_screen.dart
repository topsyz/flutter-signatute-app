import 'package:flutter/material.dart';
import 'collect_cheque_screen_componants/collect_cheque_banar.dart';
import 'collect_cheque_screen_componants/collect_screen_header.dart';
import 'collect_cheque_screen_componants/searchbox.dart';
import 'collect_cheque_screen_componants/upload_botton.dart';

class CollectScreen extends StatelessWidget {
  static String routeName = "/CollectScreen";

  const CollectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              const CollectScreenHeader(),
              CollectScreenBanar(),
              SizedBox(height: 40),
              const SearchBox(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
