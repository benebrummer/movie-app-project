import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/pages/search/widgets/details/series_stats.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../../controller/details_controller.dart';
import '../../../../entity/media/series/tv_series.dart';
import 'details_card.dart';

class SeriesDetailsPage extends StatelessWidget {
  final TvSeries series;
  SeriesDetailsPage({super.key, required this.series});

  final DetailsController _detailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    _detailsController.initSeriesDetails(series.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(series.name),
      ),
      body: SafeArea(
        child: Obx(
          () {
            return _detailsController.isLoading
                ? const Card(
                    margin: EdgeInsets.all(20),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : DetailsCard(
                    title: series.name,
                    mediaType: MediaType.tv,
                    overview: series.overview,
                    statsWidget: SeriesStats(
                      seriesDetails: _detailsController.currentSeriesDetails,
                    ),
                    producerCompanies: _detailsController
                        .currentSeriesDetails.productionCompanies,
                    posterPath: series.posterPath,
                    tagline: _detailsController.currentSeriesDetails.tagline,
                  );
          },
        ),
      ),
    );
  }
}
