import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Movies'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('TV Shows'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        DropdownButton(
          items: <String>['Movies', 'TV Shows'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {},
          value: 'Movies',
        ),
        const SizedBox(height: 20),
        const DropdownMenu(
          expandedInsets: EdgeInsets.zero,
          // TODO: enum
          initialSelection: 'movies',
          dropdownMenuEntries: [
            DropdownMenuEntry<String>(
              value: 'movies',
              label: 'Movies',
            ),
            DropdownMenuEntry<String>(
              value: 'tv_shows',
              label: 'TV Shows',
            ),
          ],
        ),
        const SizedBox(height: 20),
        SearchBar(
          leading: const Icon(Icons.search),
          trailing: <Widget>[
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {},
            ),
          ],
          hintText: 'Search _category_',
        ),
      ],
    );
  }
}
