import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/images_controller.dart';
import 'package:tmdb_api/tmdb_api.dart';

class ImagesSlider extends StatelessWidget {
  final MediaType mediaType;
  ImagesSlider({super.key, required this.mediaType});

  final ImagesController _imagesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 200,
        child: _imagesController.isLoading
            ? const Center(child: CircularProgressIndicator())
            : _imagesController.getImages(mediaType).isEmpty ||
                    _imagesController.offline
                ? const Center(child: Text('No images found'))
                : CarouselSlider.builder(
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.6,
                      autoPlay: true,
                    ),
                    itemCount: _imagesController.getImages(mediaType).length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final image =
                          _imagesController.getImages(mediaType)[index];
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                insetPadding: const EdgeInsets.all(5),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${image.filePath}',
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${image.filePath}',
                            fit: BoxFit.contain,
                            height: 200,
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
