import 'package:firebase_analytics/firebase_analytics.dart';

class MyAnalyticsHelper {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future<void> testEvenLog(_value) async {
    await analytics
        .logEvent(name: '${_value}_click', parameters: {'Value': _value});
    print('Send Event');
  }

  Future<void> testSetUserId(_value) async {
    await analytics.setUserId(id: '$_value');
    print('setUserId succeeded');
  }

  Future<void> testSetUserProperty() async {
    await analytics.setUserProperty(name: 'regular', value: 'indeed');
    print('setUserProperty succeeded');
  }

  Future<void> testSetSessionTimeout() async{
    await analytics.setSessionTimeoutDuration(Duration(milliseconds: 5000));

    await analytics.logEvent(name: 'session_mulai');
    print('setsetSessionTimeout succeeded');
  }

  Future<void> testSetAppInstanceId() async {
    final appInstanceId = await analytics.appInstanceId;
    print('App Instance ID: $appInstanceId');
  }

  Future<void> testResetAnalyticsData() async {
    await analytics.resetAnalyticsData();
    print('resetAnalysticsData succeeded');
  }

  AnalyticsEventItem itemCreator() {
    return AnalyticsEventItem(
      affiliation: 'affil',
      coupon: 'coup',
      creativeName: 'creativeName',
      creativeSlot: 'creativeSlot',
      discount: 2.22,
      index: 3,
      itemBrand: 'itemBrand',
      itemCategory: 'itemCategory',
      itemCategory2: 'itemCategory2',
      itemCategory3: 'itemCategory3',
      itemCategory4: 'itemCategory4',
      itemCategory5: 'itemCategory5',
      itemId: 'itemId',
      itemListId: 'itemListId',
      itemListName: 'itemListName',
      itemName: 'itemName',
      itemVariant: 'itemVariant',
      locationId: 'locationId',
      price: 9.99,
      currency: 'USD',
      promotionId: 'promotionId',
      promotionName: 'promotionName',
      quantity: 1,
    );
  }

  Future<void> testSetLogAddPaymentInfo() async {
    await analytics.logAddPaymentInfo();

    print('Payment info added: Event "add_payment_info" logged');
  }
  
  Future<void> testLogAddToCart() async {
    await analytics.logAddToCart(
      currency: 'USD',
      value: 123,
      items: [itemCreator(), itemCreator()],
    );

    print('Add To Cart added: Event "add_to_cart');
  }


  Future<void> testLogPurchase() async {
    await analytics.logPurchase(
      currency: 'USD',
      transactionId: 'transaction-id'
    );
  }
}