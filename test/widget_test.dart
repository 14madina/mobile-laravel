import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tugas10_2a/main.dart';

void main() {
  testWidgets('Smoke test untuk API Gempa', (WidgetTester tester) async {
    // Jalankan aplikasi ModNetworking kita
    await tester.pumpWidget(ModNetworking());

    // Karena ini mengambil data dari internet, kita hanya mengecek
    // apakah kerangka layarnya (Scaffold) berhasil dibuat tanpa error.
    expect(find.byType(Scaffold), findsOneWidget);
  });
}