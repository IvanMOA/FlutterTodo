import 'dart:async';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todolist/main.dart';
import 'package:todolist/src/models/auth.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements User {}

class MockAuthResult extends Mock implements UserCredential {}

void main() {
  MockFirebaseAuth _auth = MockFirebaseAuth();
  StreamController<MockFirebaseUser> _userSC =
      StreamController<MockFirebaseUser>();
  var _user = _userSC.stream;

  when(_auth.authStateChanges()).thenAnswer((_) => _user);

  var auth = Auth.instance(auth: _auth);

  test('Auth model works', () async {
    when(_auth.signInWithEmailAndPassword(email: 'email', password: 'password'))
        .thenAnswer((_) async {
      _userSC.add(MockFirebaseUser());
      return MockAuthResult();
    });

    var calls = 0;
    auth.addListener(() {
      print('Calls ${calls}');
      print(auth.logginIn);
      if (calls == 0) {
        expect(auth.logginIn, isTrue);
      }
      if (calls == 1) {
        expect(auth.logginIn, isFalse);
        expect(auth.loginError, isFalse);
      }
      calls += 1;
    });

    await auth.signInWithEmailAndPassword('email', 'password');
    expect(calls, 2);
  });
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
