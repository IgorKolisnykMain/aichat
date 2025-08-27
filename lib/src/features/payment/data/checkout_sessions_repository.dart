import 'package:aichat/src/features/onboarding/auth/domain/models/app_user.dart';
import 'package:aichat/src/features/payment/domain/checkout_session.dart';
import 'package:aichat/src/features/store/domain/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'checkout_sessions_repository.g.dart';

/// Class used to read and write data to the checkout_sessions documents
/// written by the Firebase Stripe extension
class CheckoutSessionsRepository {
  const CheckoutSessionsRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String checkoutSessionsPath(UserID uid) => 'stripe_customers/$uid/checkout_sessions';

  static String checkoutSessionPath(UserID uid, String sessionId) =>
      'stripe_customers/$uid/checkout_sessions/$sessionId';

  /// start a new checkout session by writing a new document to Firestore
  /// and return the newly created document ID
  Future<String> writeCheckoutSession({
    required UserID uid,
    required int amount,
    required Product product,
    required bool isWeb,
    String? cancelUrl,
    String? successUrl,
  }) async {
    final docRef = await _firestore.collection(checkoutSessionsPath(uid)).add(
      // https://stripe.com/docs/api/checkout/sessions/object
      {
        'client': isWeb ? 'web' : 'mobile',
        'mode': 'payment',
        'amount': amount,
        // https://stripe.com/docs/api/payment_intents/object#payment_intent_object-currency
        'currency': 'usd',
        // When paying on web, the line items will be shown in the checkout page
        'line_items': [
          {
            'price_data': {
              'product_data': {
                'name': product.title,
              },
              'currency': 'usd',
              'unit_amount': (product.price * 100).toInt(),
            },
            'quantity': 1,
          },
        ],
        if (successUrl != null) 'success_url': successUrl,
        if (cancelUrl != null) 'cancel_url': cancelUrl,
      },
    );
    return docRef.id;
  }

  /// Stream used to get checkout session updates, needed to continue the
  /// checkout process
  Stream<CheckoutSession> watchCheckoutSession(UserID uid, String sessionId) {
    final ref = _checkoutSessionRef(uid, sessionId);
    return ref.snapshots().map((snapshot) => snapshot.data()!);
  }

  DocumentReference<CheckoutSession> _checkoutSessionRef(UserID uid, String sessionId) => _firestore
      .doc(checkoutSessionPath(uid, sessionId))
      .withConverter(
        fromFirestore: (doc, _) => CheckoutSession.fromMap(doc.data()!),
        toFirestore: (session, _) => session.toMap(),
      );
}

@Riverpod(keepAlive: true)
CheckoutSessionsRepository checkoutSessionsRepository(Ref ref) {
  return CheckoutSessionsRepository(FirebaseFirestore.instance);
}
