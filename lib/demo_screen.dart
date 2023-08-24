import 'package:flutter/material.dart';
import 'package:url_launcher_demo/widgets/customized_button.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Url Launcher"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 30,
        ),
        children: [

          CustomizedButton(onTap: () {
          }, label: "Send an Email"),

          CustomizedButton(onTap: () {
          }, label: "Send an SMS"),

          CustomizedButton(onTap: () {
          }, label: "TEL"),

          CustomizedButton(onTap: () {
          }, label: "Redirection In-App Preview"),

          CustomizedButton(onTap: () {
          }, label: "Redirection"),
        ],
      )
    );
  }
}
