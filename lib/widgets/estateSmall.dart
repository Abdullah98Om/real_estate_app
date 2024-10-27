import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/views/detailsItem.dart';
import 'package:real_estate_app/widgets/loader.dart';

import '../models/realEstatesModel.dart';
import '../utils/constant.dart';
import '../utils/myStyle.dart';

class EstateSmall extends StatelessWidget {
  RealEstateModel? realEstate;
  EstateSmall({super.key, this.realEstate});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsItem(id: realEstate!.id!)),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
        // color: Colors.red,
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height * 0.3,
        // margin: const EdgeInsets.only(left: 10),
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                height: MediaQuery.of(context).size.height * 0.15,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => loader(),
                imageUrl: realEstate!.image!,
                // "https://tahh3ccmtxa7trnk.s3.me-south-1.amazonaws.com/13237219-434f-426e-8091-ebc0f2fb40a0"
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              realEstate!.title,
              textDirection: TextDirection.rtl,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              // softWrap: true,
              style: AppStyles.h3(textColor: myPrimaryColor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.003,
            ),
            Text(
              "${realEstate!.price!.toString()}  IQD",
              textDirection: TextDirection.rtl,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.h3(textColor: Colors.green),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.001,
            ),
            Text(
              realEstate!.offerType == "SELL" ? "للبيع" : "للايجار",
              textDirection: TextDirection.rtl,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.h3(textColor: Colors.black),
            ),
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${realEstate!.country!.name} - ${realEstate!.city!.name} - ${realEstate!.subDistrict!.name}",
                  textDirection: TextDirection.rtl,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.h4(textColor: Colors.grey),
                ),
                const SizedBox(width: 3),
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                  size: 16,
                ),
              ],
            ),
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "المساحة : ",
                  textDirection: TextDirection.rtl,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.h4(textColor: Colors.grey),
                ),
                Text(
                  "${realEstate!.area} متر",
                  textDirection: TextDirection.rtl,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.h4(textColor: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
