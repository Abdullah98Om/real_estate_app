import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/utils/constant.dart';
import 'package:real_estate_app/viewmodels/homeProviders.dart';

import '../viewmodels/splashProviders.dart';
import '../widgets/myAppBar.dart';
import 'filterResoults.dart';

class FilterItems extends ConsumerWidget {
  const FilterItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cities = ref.watch(readCitiesProvider);
    // final services = ref.watch(realEstateServiceProvider);

    final categories = ref.watch(readCategoriesProvider);

    final citySelected = ref.watch(citySelectedProvider);
    final categorySelected = ref.watch(categorySelectedProvider);
    final subCategorySelected = ref.watch(subCategorySelectedProvider);
    final typeSelected = ref.watch(typeSelectedProvider);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 231, 231),
      appBar: Myappbar(
          title: "الفلتر",
          icon: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25,
            ),
          )),
      body: ListView(
        children: [
          const SizedBox(height: 15),
          //show type
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "نوع العرض",
                      style: TextStyle(
                          color: myPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 15),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        ref.read(typeSelectedProvider.notifier).state = 0;
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.25,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: 0 == typeSelected
                                ? myPrimaryColor.withOpacity(0.1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: 0 == typeSelected
                                    ? myPrimaryColor
                                    : Colors.grey)),
                        child: Center(
                            child: Text("للبيع",
                                style: TextStyle(
                                    color: 0 == typeSelected
                                        ? myPrimaryColor
                                        : Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        ref.read(typeSelectedProvider.notifier).state = 1;
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.25,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: 1 == typeSelected
                                ? myPrimaryColor.withOpacity(0.1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: 1 == typeSelected
                                    ? myPrimaryColor
                                    : Colors.grey)),
                        child: Center(
                            child: Text("للأيجار",
                                style: TextStyle(
                                    color: 1 == typeSelected
                                        ? myPrimaryColor
                                        : Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          // category
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "نوع العقار",
                      style: TextStyle(
                          color: myPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 15),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        ref.read(categorySelectedProvider.notifier).state =
                            index;
                        ref.read(subCategorySelectedProvider.notifier).state =
                            0;
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: index == categorySelected
                                ? myPrimaryColor.withOpacity(0.1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: index == categorySelected
                                    ? myPrimaryColor
                                    : Colors.grey)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                                width: MediaQuery.of(context).size.width * 0.15,
                                fit: BoxFit.cover,
                                imageUrl: categories[index].image!),
                            Center(
                                child: Text(categories[index].names!.arIQ!,
                                    style: TextStyle(
                                        color: index == categorySelected
                                            ? myPrimaryColor
                                            : Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          // sub category
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "نوع العقار",
                      style: TextStyle(
                          color: myPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 15),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        categories[categorySelected].subCategories!.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        ref.read(subCategorySelectedProvider.notifier).state =
                            index;
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: index == subCategorySelected
                                ? myPrimaryColor.withOpacity(0.1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: index == subCategorySelected
                                    ? myPrimaryColor
                                    : Colors.grey)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                                width: MediaQuery.of(context).size.width * 0.15,
                                fit: BoxFit.cover,
                                imageUrl: categories[categorySelected]
                                    .subCategories![subCategorySelected]
                                    .image),
                            Center(
                                child: Text(
                                    categories[categorySelected]
                                        .subCategories![index]
                                        .names!
                                        .arIQ!,
                                    style: TextStyle(
                                        color: index == categorySelected
                                            ? myPrimaryColor
                                            : Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          // location
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "المدينة",
                      style: TextStyle(
                          color: myPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 15),
                cities.length > 0
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: cities.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              ref.read(citySelectedProvider.notifier).state =
                                  index;
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  color: index == citySelected
                                      ? myPrimaryColor.withOpacity(0.1)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: index == citySelected
                                          ? myPrimaryColor
                                          : Colors.grey)),
                              child: Center(
                                  child: Text(
                                cities[index].names!.arIQ ?? "",
                                style: TextStyle(
                                    color: index == citySelected
                                        ? myPrimaryColor
                                        : Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),

          Center(
            child: InkWell(
              onTap: () {
                final filterParams = FilterParams(
                  cityID: cities[citySelected].id!,
                  offerID: typeSelected == 0 ? 'SELL' : 'RENT',
                  subCatID: categories[categorySelected]
                      .subCategories![subCategorySelected]
                      .id,
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FilterResults(
                            filterParams: filterParams,
                          )),
                );

                // filterRealEstatesProvider()
                // services.getRealEstates(
                //   cityId: cities[citySelected].id,
                //   offerType: typeSelected == 0 ? 'SELL' : "RENT",
                //   subCategoryId: categories[categorySelected]
                //       .subCategories![subCategorySelected]
                //       .id,
                // );
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: myPrimaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Center(
                      child: Text(
                    "أظهار النتائج",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ))),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
