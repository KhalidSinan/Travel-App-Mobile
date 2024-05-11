// ignore_for_file: prefer_collection_literals

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayPal extends StatelessWidget {
  const PayPal({super.key, required this.url, required this.onSuccess});
  final String url;
  final VoidCallback onSuccess;
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      gestureRecognizers: Set()
        ..add(Factory<DragGestureRecognizer>(
            () => VerticalDragGestureRecognizer())),
      onPageFinished: (value) {
        debugPrint(value);
      },
      navigationDelegate: (NavigationRequest request) async {
        if (request.url.contains("http://return_url/?status=success")) {
          onSuccess();
        }
        if (request.url.contains("https://10.0.2.2:5000/payment/cancel")) {
          // debugPrint("failure");
          // Get.back();
        }
        return NavigationDecision.navigate;
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:travelapp_flutter/core/helpers/paypal_widget.dart';

// class Test extends StatelessWidget {
//   const Test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: TextButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: ((context) => const Center(
//                         child: PayPal(),
//                       )),
//                 ),
//               );
//             },
//             child: const Text("PayPal"),
//           ),
//         ),
//       ),
//     );
//   }
// }
