import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/entity/media/series/tv_series.dart';
import 'package:movie_app_project/pages/widgets/appbar/details/series_app_bar.dart';
import 'package:movie_app_project/pages/widgets/reviews_button.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../controller/details_controller.dart';
import '../../../controller/images_controller.dart';

class SeriesDetailsPage extends StatelessWidget {
  SeriesDetailsPage({super.key, required this.show});

  final TvSeries show;
  final DetailsController _detailController = Get.find<DetailsController>();
  final ImagesController _imagesController = Get.find<ImagesController>();

  @override
  Widget build(BuildContext context) {
    _imagesController.getSeriesImages(show.id);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SeriesAppBar(series: show),
            SliverToBoxAdapter(
              child: Obx(
                () => _detailController.isLoading
                    ? const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                show.name,
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                              width: double.infinity,
                            ),
                            Center(
                              child: Text(
                                _detailController.currentSeriesDetails.tagline,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                              width: double.infinity,
                            ),
                            show.overview.isEmpty
                                ? const Text('No overview available')
                                : Text(show.overview,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    )),
                            const SizedBox(
                              height: 22,
                              width: double.infinity,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_today),
                                      const SizedBox(width: 5),
                                      Text(show.firstAirDate),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                          '${show.voteAverage.toStringAsFixed(1)}/10 (${_detailController.currentSeriesDetails.voteCount})'),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      const Text('Seasons:'),
                                      const SizedBox(width: 5),
                                      Text(
                                          '${_detailController.currentSeriesDetails.numberOfSeasons}'),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      const Text('Episodes:'),
                                      const SizedBox(width: 5),
                                      Text(
                                          '${_detailController.currentSeriesDetails.numberOfEpisodes}'),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      const Text('In production:'),
                                      const SizedBox(width: 5),
                                      _detailController
                                              .currentSeriesDetails.inProduction
                                          ? const Icon(Icons.check,
                                              color: Colors.green)
                                          : const Icon(Icons.close,
                                              color: Colors.red),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                          'Original Language: ${show.originalLanguage}'),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                          'Created by: ${_detailController.currentSeriesDetails.createdBy.isEmpty ? '-' : _detailController.currentSeriesDetails.createdBy.map((e) => e.name).join(', ')}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Produced by',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Wrap(
                                    direction: Axis.vertical,
                                    children: _detailController
                                        .currentSeriesDetails
                                        .productionCompanies
                                        .map((company) => Text(company.name))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Obx(
                              () => SizedBox(
                                height: 200,
                                child: _imagesController.isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : _imagesController.seriesImages.isEmpty
                                        ? const Text('No images found')
                                        : CarouselSlider.builder(
                                            options: CarouselOptions(
                                              enableInfiniteScroll: false,
                                              enlargeCenterPage: true,
                                              viewportFraction: 0.6,
                                              autoPlay: true,
                                            ),
                                            itemCount: _imagesController
                                                .seriesImages.length,
                                            itemBuilder: (BuildContext context,
                                                int index, int realIndex) {
                                              final image = _imagesController
                                                  .seriesImages[index];
                                              return GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return Dialog(
                                                        insetPadding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: Image.network(
                                                          'https://image.tmdb.org/t/p/w500${image.filePath}',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
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
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: ReviewsButton(
                                  mediaId: show.id,
                                  mediaType: MediaType.tv,
                                  title: show.name),
                            )
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
