import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
            CustomizedButton(
                onTap: () {
                  emailRedirection();
                },
                label: "Send an Email"),
            CustomizedButton(
                onTap: () {
                  smsRedirection();
                },
                label: "Send an SMS"),
            CustomizedButton(
                onTap: () {
                  telRedirection();
                },
                label: "TEL"),
            CustomizedButton(
                onTap: () {
                  urlRedirectInApp('https://www.google.com');
                },
                label: "Redirection In-App Preview"),
            CustomizedButton(
                onTap: () {
                  urlRedirect("https://www.flutterdirectory.com");
                },
                label: "Redirection"),

            CustomizedButton(
                onTap: () {
                  launchMap();
                },
                label: "Redirect to Map"),
          ],
        ));
  }

  dynamic urlRedirect(String url) async {
    final result = await launchUrl(Uri.parse(url));

    if (!result) {
      throw Exception("Error");
    }
  }

  dynamic urlRedirectInApp(String url) async {
    final result = await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
        enableJavaScript: true,
        enableDomStorage: true
      ),
    );

    if (!result) {
      throw Exception("Error");
    }
  }

  String encodeQueryParams(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            "${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}")
        .join('&');
  }

  dynamic emailRedirection() async {
    Uri emailRes = Uri(
      scheme: 'mailto',
      path: 'a@gmail.com',
      query: encodeQueryParams({"subject": "Temporary email subject"}),
    );

    await launchUrl(emailRes);
  }

  dynamic smsRedirection() async {
    Uri emailRes = Uri(
      scheme: 'sms',
      path: '033675756464',
      query: encodeQueryParams({"body": "Temporary SMS subject"}),
    );

    await launchUrl(emailRes);
  }

  dynamic telRedirection() async {
    Uri emailRes = Uri(
      scheme: 'tel',
      path: '033675756464',
    );

    await launchUrl(emailRes);
  }

  launchMap() async {

    String homeLat = "37.3230";
    String homeLng = "-122.0312";

    String googleMapslocationUrl = "https://www.google.com/maps/search/?api=1&query=$homeLat,$homeLng";


    final String encodedURl = Uri.encodeFull(googleMapslocationUrl);

    final result = await launchUrl(Uri.parse(encodedURl));

    if (!result) {
      throw Exception("Error");
    }
  }
}
