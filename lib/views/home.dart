import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/utils/constant.dart';
import 'package:real_estate_app/views/filterItems.dart';

import '../viewmodels/homeProviders.dart';
import '../widgets/carouselSlider.dart';
import '../widgets/estateSmall.dart';
import '../widgets/myAppBar.dart';

class Home extends ConsumerWidget {
  Home();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // إضافة المستمع لتحميل المزيد من البيانات
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // هنا يمكنك تحميل المزيد من البيانات عند الوصول إلى النهاية
        ref.watch(realEstatesProvider);
      }
    });

    final allRealEstatesAsync = ref.watch(realEstatesProvider);

    return Scaffold(
      appBar: Myappbar(
        title: "بيتي",
        icon: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FilterItems()),
            );
          },
          child: const Icon(
            Icons.filter_alt_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Slider
            MyCarouselSlider(
              imgs: const [
                "https://tahh3ccmtxa7trnk.s3.me-south-1.amazonaws.com/13237219-434f-426e-8091-ebc0f2fb40a0",
                "https://tahh3ccmtxa7trnk.s3.me-south-1.amazonaws.com/82610ce4-573c-4b8a-8c4a-da7cd1bdb610",
                "https://tahh3ccmtxa7trnk.s3.me-south-1.amazonaws.com/12687f6b-00d3-49d6-9cd9-324ecc1fcbac"
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: allRealEstatesAsync.when(
                data: (realEstates) {
                  final totalCount = realEstates.length; // عدد العقارات المحملة
                  final totalPages = (totalCount ~/ 10) +
                      (totalCount % 10 > 0 ? 1 : 0); // احسب عدد الصفحات

                  return Text(
                    'عدد العقارات: $totalCount | عدد الصفحات: $totalPages',
                    style: TextStyle(fontSize: 16),
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (error, stack) => const SizedBox.shrink(),
              ),
            ),
            Divider(
              color: myPrimaryColor.withOpacity(0.5),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            // عرض قائمة العقارات
            allRealEstatesAsync.when(
              data: (realEstates) {
                return ListView.builder(
                  controller: scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: realEstates.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          EstateSmall(realEstate: realEstates[index]),
                          const Divider(),
                        ],
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          ],
        ),
      ),
    );
  }
}
