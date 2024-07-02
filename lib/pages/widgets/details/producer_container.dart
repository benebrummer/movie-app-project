import 'package:flutter/material.dart';

import '../../../entity/media/production_company.dart';

class ProducerContainer extends StatelessWidget {
  final List<ProductionCompany> productionCompanies;
  const ProducerContainer({super.key, required this.productionCompanies});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            children: productionCompanies
                .map((company) => Text(company.name))
                .toList(),
          ),
        ],
      ),
    );
  }
}
