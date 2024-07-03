import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/entity/media/series/tv_series.dart';
import 'package:movie_app_project/pages/widgets/appbar/details/series_app_bar.dart';
import 'package:movie_app_project/pages/widgets/details/images_slider.dart';
import 'package:movie_app_project/pages/widgets/details/producer_container.dart';
import 'package:movie_app_project/pages/widgets/details/series_stats.dart';
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
                            const SizedBox(height: 20),
                            show.overview.isEmpty
                                ? const Center(
                                    child: Text('No overview available'))
                                : Text(show.overview,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    )),
                            const SizedBox(height: 22),
                            SeriesStatsContainer(
                              show: _detailController.currentSeriesDetails,
                            ),
                            const SizedBox(height: 5),
                            _detailController.currentSeriesDetails
                                    .productionCompanies.isEmpty
                                ? const SizedBox()
                                : ProducerContainer(
                                    productionCompanies: _detailController
                                        .currentSeriesDetails
                                        .productionCompanies,
                                  ),
                            const SizedBox(height: 10),
                            ImagesSlider(mediaType: MediaType.tv),
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
