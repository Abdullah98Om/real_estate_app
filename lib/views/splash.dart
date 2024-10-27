import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/views/home.dart';
import '../utils/constant.dart';
import '../viewmodels/splashProviders.dart'; // هذا هو المزود الذي يستدعي بيانات المدن

class Splash extends ConsumerWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // مراقبة حالة تحميل البيانات من خلال FutureProvider
    final citiesAsyncValue = ref.watch(citiesProvider);
    final categoriesAsyncValue = ref.watch(categoriesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: citiesAsyncValue.when(
          data: (cities) {
            return categoriesAsyncValue.when(
              data: (categories) {
                // بعد الانتهاء من تحميل البيانات، انتقل إلى الشاشة الرئيسية
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                });
                return Image.asset(
                  myIcon,
                  width: 400,
                  height: 400,
                );
              },
              loading: () => Image.asset(
                myIcon,
                width: 400,
                height: 400,
              ), // عرض مؤشر تحميل
              error: (error, stack) => Text('حدث خطأ في التصنيفات: $error'),
            );
          },
          loading: () => Image.asset(
            myIcon,
            width: 400,
            height: 400,
          ), // عرض مؤشر تحميل
          error: (error, stack) => Text('حدث خطأ في المدن: $error'),
        ),
      ),
    );
  }
}
