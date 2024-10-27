import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/utils/constant.dart';
import 'package:real_estate_app/utils/myStyle.dart';
import 'package:real_estate_app/widgets/myAppBar.dart';
import '../viewmodels/homeProviders.dart';
import '../widgets/carouselSlider.dart';

class DetailsItem extends ConsumerWidget {
  String id;
  DetailsItem({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // مشاهدة المزود selectedRealEstateProvider للحصول على البيانات
    final realEstateAsync = ref.watch(selectedRealEstateProvider(id));

    return Scaffold(
      appBar: Myappbar(
        title: realEstateAsync.when(
          data: (realEstate) => "تفاصيل العقار", // اسم العقار عند توفر البيانات
          loading: () => "جاري التحميل...",
          error: (err, stack) => "خطأ",
        ),
        icon: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // زر الاتصال
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                border: Border.all(color: myPrimaryColor),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "اتصل",
                  style: AppStyles.h2(textColor: myPrimaryColor),
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            // زر واتساب
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                color: myPrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "واتساب",
                  style: AppStyles.h2(textColor: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: realEstateAsync.when(
          data: (realEstate) => Column(
            children: [
              MyCarouselSlider(
                  imgs: [for (String img in realEstate.images!) img]),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            realEstate.title,
                            textDirection: TextDirection.rtl,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.h2(textColor: Colors.black),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            textAlign: TextAlign.end,
                            textDirection: TextDirection.rtl,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            "د.ع ${realEstate.price.toString()}",
                            style: AppStyles.h2(
                                textColor:
                                    const Color.fromARGB(255, 61, 204, 13)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: ListView(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "الجلوس",
                                  style: AppStyles.h3(textColor: Colors.black),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  realEstate.noOfLivingRooms.toString(),
                                  style: AppStyles.h3(textColor: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "النوم",
                                  style: AppStyles.h3(textColor: Colors.black),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  realEstate.noOfBedRooms.toString(),
                                  style: AppStyles.h3(textColor: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "الحمامات",
                                  style: AppStyles.h3(textColor: Colors.black),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  realEstate.noOfBathRooms.toString(),
                                  style: AppStyles.h3(textColor: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "المعيشة",
                                  style: AppStyles.h3(textColor: Colors.black),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  realEstate.noOfLivingRooms.toString(),
                                  style: AppStyles.h3(textColor: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            "نوع العرض",
                            maxLines: 1,
                            style: AppStyles.h3(textColor: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              realEstate.offerType!,
                              maxLines: 1,
                              style: AppStyles.h3(textColor: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            "نوع الدفع",
                            maxLines: 1,
                            style: AppStyles.h3(textColor: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              realEstate.payType,
                              maxLines: 1,
                              style: AppStyles.h3(textColor: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            "نوع العقار",
                            maxLines: 1,
                            style: AppStyles.h3(textColor: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "${realEstate.subCategory!.name} - ${realEstate.category!.name}",
                              maxLines: 1,
                              style: AppStyles.h3(textColor: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            "نوع الملكية",
                            maxLines: 1,
                            style: AppStyles.h3(textColor: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              realEstate.ownerType.toString(),
                              maxLines: 1,
                              style: AppStyles.h3(textColor: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            "العنوان",
                            maxLines: 1,
                            style: AppStyles.h3(textColor: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "${realEstate.country!.name} - ${realEstate.city!.name} - ${realEstate.subDistrict!.name}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.h3(textColor: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 3,
                    ),
                  ],
                ),
              ),

              /////////////////////////
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  realEstate.description!,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.start,
                  style: AppStyles.h2(textColor: Colors.grey),
                ),
              ),
            ],
          ),
          loading: () => SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: const Center(child: CircularProgressIndicator())),
          error: (error, stack) =>
              const Center(child: Text("حدث خطأ أثناء تحميل البيانات")),
        ),
      ),
    );
  }
}
