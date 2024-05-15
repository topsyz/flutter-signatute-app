  import 'package:flutter/material.dart';
import 'package:signio/collect_cheque_screen/collect_cheque_screen_componants/names.dart';

  class SearchBox extends StatelessWidget {


    const SearchBox({super.key});

    @override
    Widget build(BuildContext context) {
      return TextFormField(
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          labelText: 'the signatory of the cheque',
          hintText: "Enter the signatory name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      );
    }
  }
