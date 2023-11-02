import 'package:flutter/material.dart';
import 'package:flutter_firebase_backend/MyAnalyticsHelper.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  MyAnalyticsHelper fbAnalytics = MyAnalyticsHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Working with Analytics")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  fbAnalytics.testSetUserId("agung");
                },
                child: Text("Send Event"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  fbAnalytics.testSetUserProperty();
                },
                child: Text("Send Property"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  fbAnalytics.testEvenLog("send_error");
                },
                child: Text("Send Error"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  fbAnalytics.testSetSessionTimeout();
                },
                child: Text("Send Session Timeout"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  fbAnalytics.testSetAppInstanceId();
                },
                child: Text("Get App Instance ID"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  fbAnalytics.testResetAnalyticsData();
                },
                child: Text("Test resetAnalyticsData"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  fbAnalytics.testSetLogAddPaymentInfo();
                },
                child: Text("Test LogAddPaymentInfo"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  fbAnalytics.testLogAddToCart();
                },
                child: Text("Test LogAddToCart"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  fbAnalytics.testLogPurchase();
                },
                child: Text("Test LogPurchase"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}