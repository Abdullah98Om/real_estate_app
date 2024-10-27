import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/widgets/myAppBar.dart';
import '../viewmodels/homeProviders.dart';
import '../widgets/estateSmall.dart';

class FilterResults extends ConsumerWidget {
  final FilterParams filterParams;
  const FilterResults({super.key, required this.filterParams});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final realEstatesAsync = ref.watch(filterRealEstatesProvider(filterParams));

    return Scaffold(
      appBar: Myappbar(
        title: "نتائج الفلتر",
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
      body: realEstatesAsync.when(
        data: (realEstates) {
          if (realEstates.isEmpty) {
            return Center(
              child: Text("لا توجد نتائج للعرض"),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: realEstates.length,
                  itemBuilder: (context, index) {
                    final realEstate = realEstates[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          EstateSmall(realEstate: realEstate),
                          const Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('حدث خطأ: $error')),
      ),
    );
  }
}
