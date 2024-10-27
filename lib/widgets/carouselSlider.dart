// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/widgets/loader.dart';

// ignore: must_be_immutable
class MyCarouselSlider extends StatelessWidget {
  List<String>? imgs;
  MyCarouselSlider({super.key, required this.imgs});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1,
        // enlargeCenterPage: true,
        aspectRatio: 16 / 9, // نسبة الطول للعرض
        initialPage: 0,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlay: true,
        reverse: true,
        height: MediaQuery.of(context).size.height * 0.22,
      ),
      items: imgs!
          .map(
            (i) => CachedNetworkImage(
              imageUrl: i,
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              placeholder: (context, url) => loader(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          )
          .toList(),
    );
  }
}
