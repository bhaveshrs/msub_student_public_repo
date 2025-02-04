import 'package:url_launcher/url_launcher.dart' as launcher;

import '../utils/status_messages.dart';

class UrlLauncherService {


  // static Future<void> launchFacebook() async {
  //   await launcher.launchUrl(Uri.parse(_facebook),
  //       mode: launcher.LaunchMode.inAppWebView,
  //       webViewConfiguration: const launcher.WebViewConfiguration(enableJavaScript: true, enableDomStorage: true));
  // }



  // launch provided url
  // static Future<void> launchUrl(String url) async {
  //   if (await launcher.canLaunchUrl(Uri.parse(url))) {
  //     try {
  //       await launcher.launchUrl(Uri.parse(url),
  //           mode: launcher.LaunchMode.inAppWebView,
  //           webViewConfiguration: const launcher.WebViewConfiguration(
  //               enableJavaScript: true, enableDomStorage: true));
  //     } catch (e) {
  //       showErrorMessage("Something went wrong");
  //     }
  //   }
  // }

  // launch provided url
  static Future<void> launchUrl(String url) async {
    final uri = Uri.parse(url);

    if (await launcher.canLaunchUrl(uri)) {
      try {
        await launcher.launchUrl(
          uri,
          mode: launcher.LaunchMode.externalApplication,
        );
      } catch (e) {
        print("Error launching URL: $e");
        showErrorMessage("Something went wrong");
      }
    } else {
      print("Cannot launch URL: $url");
      showErrorMessage("Cannot launch URL");
    }
  }

}
