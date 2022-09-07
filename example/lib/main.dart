import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_onfido_plus/flutter_onfido_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> init() async {
    try {
      final exampleSdkToken =
          "eyJhbGciOiJFUzUxMiJ9.eyJleHAiOjE2NjI1OTA5NTIsInBheWxvYWQiOnsiYXBwIjoiZDViMzY0N2YtNTI1MS00ZWZlLWEwNzAtODNkODlmYWNhNjRjIiwiY2xpZW50X3V1aWQiOiIxOGRlYmJmMS00MTJhLTRjNTgtYjUxYi01Y2JlYzBlZDZjM2MiLCJpc19zYW5kYm94Ijp0cnVlLCJzYXJkaW5lX3Nlc3Npb24iOiJiZDcwNmUxOS05Njg3LTQyYmQtYTFjYi1kNmJjMjUwMmNmN2EifSwidXVpZCI6IkpUVERtQ1VNTXZPIiwidXJscyI6eyJkZXRlY3RfZG9jdW1lbnRfdXJsIjoiaHR0cHM6Ly9zZGsub25maWRvLmNvbSIsInN5bmNfdXJsIjoiaHR0cHM6Ly9zeW5jLm9uZmlkby5jb20iLCJob3N0ZWRfc2RrX3VybCI6Imh0dHBzOi8vaWQub25maWRvLmNvbSIsImF1dGhfdXJsIjoiaHR0cHM6Ly9hcGkub25maWRvLmNvbSIsIm9uZmlkb19hcGlfdXJsIjoiaHR0cHM6Ly9hcGkub25maWRvLmNvbSIsInRlbGVwaG9ueV91cmwiOiJodHRwczovL2FwaS5vbmZpZG8uY29tIn19.MIGHAkIBymfA66IGqw9t5hIWyGQoRL8lR0wxCgOaWxwwu4YUaY4ELmT9kaShIPmm47cf7BibXVZApAv47y4rkYdWKSVOJZ0CQQ5qjR7dJCB7RXoo9eIffG6gBbwpMb2nIX6kvzvIZUXCZNRSHfXnx0EVy-aHMdqLWcGhSjCux9tU1XtZzXBPgInJ";
      final result = await FlutterOnfidoPlus.start(
        config: OnfidoConfig(
          sdkToken:
              // PROVIDE SDK TOKEN YOU'VE GOT FROM YOUR BACKEND
              exampleSdkToken,
          flowSteps: OnfidoFlowSteps(
            welcome: true,
            captureDocument: OnfidoCaptureDocumentStep(
              countryCode: OnfidoCountryCode.USA,
              docType: OnfidoDocumentType.GENERIC,
            ),
            captureFace: OnfidoCaptureFaceStep(OnfidoCaptureType.PHOTO),
          ),
        ),
        iosAppearance: OnfidoIOSAppearance(
          onfidoPrimaryColor: "#0043DF",
        ),
      );
      print(result);
      // ASK YOUR BACKEND IF USER HAS PASSED VERIFICATION
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              MaterialButton(
                onPressed: init,
                child: Text('start'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
