import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/realEstatesModel.dart';
import '../services/real_estate_service.dart';

// مزود خدمة العقارات
final realEstateServiceProvider = Provider<RealEstateService>((ref) {
  return RealEstateService();
});

// مزود لحالة البيانات المتعلقة بالعقارات
final hasMoreDataProvider = StateProvider<bool>((ref) => true);

// مزود بيانات العقارات
final allRealEstatesProvider =
    StateNotifierProvider<RealEstatesNotifier, List<RealEstateModel>>((ref) {
  return RealEstatesNotifier();
});

// مزود لجلب جميع العقارات
final realEstatesProvider = FutureProvider<List<RealEstateModel>>((ref) async {
  final realEstateService = ref.watch(realEstateServiceProvider);
  List<RealEstateModel> estates = await realEstateService.getRealEstates();

  // تحديث حالة البيانات
  if (estates.isNotEmpty) {
    ref.read(allRealEstatesProvider.notifier).addAll(estates);
  } else {
    ref.read(hasMoreDataProvider.notifier).state = false;
  }

  return estates;
});

// مزود لجلب تفاصيل عقار محدد بناءً على المعرف
final selectedRealEstateProvider =
    FutureProvider.family<RealEstateModel, String>((ref, id) async {
  final realEstateService = ref.watch(realEstateServiceProvider);
  final realEstate = await realEstateService.getRealEstateDetails(id);
  return realEstate!;
});

// تعريف معلمات الفلترة
class FilterParams {
  final String cityID;
  final String offerID;
  final String subCatID;

  FilterParams({
    required this.cityID,
    required this.offerID,
    required this.subCatID,
  });
}

// مزود لجلب العقارات بناءً على معلمات الفلترة
final filterRealEstatesProvider =
    FutureProvider.family<List<RealEstateModel>, FilterParams>(
        (ref, params) async {
  final realEstateService = ref.watch(realEstateServiceProvider);
  return await realEstateService.getRealEstates(
    cityId: params.cityID,
    offerType: params.offerID,
    subCategoryId: params.subCatID,
  );
});

// StateNotifier لإدارة قائمة العقارات
class RealEstatesNotifier extends StateNotifier<List<RealEstateModel>> {
  RealEstatesNotifier() : super([]);

  void addAll(List<RealEstateModel> estates) {
    state = [...state, ...estates]; // إضافة البيانات الجديدة
  }
}
