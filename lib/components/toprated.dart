import 'package:flutter/material.dart';

import '../shared/text.dart';


class TopRatedMovies extends StatelessWidget {
  final List _toprated;

  const TopRatedMovies({required List toprated, super.key}) : _toprated = toprated;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: 'Top Rated Movies',
            size: 26,
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _toprated.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        _toprated[index]['poster_path']),
                              ),
                            ),
                            height: 200,
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            child: modified_text(
                                size: 15,
                                text: _toprated[index]['title'] != null
                                    ? _toprated[index]['title']
                                    : 'Loading'),
                          )
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
