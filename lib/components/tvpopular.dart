import 'package:flutter/material.dart';

import '../shared/text.dart';

class TVPopularSerie extends StatelessWidget {
  final List _tvpopular;

  const TVPopularSerie({required List tvpopular, super.key})
      : _tvpopular = tvpopular;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: 'Seriados de TV Recem Lançados',
            size: 26,
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _tvpopular.length,
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
                                        _tvpopular[index]['poster_path']),
                              ),
                            ),
                            height: 200,
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            child: modified_text(
                                size: 15,
                                text: _tvpopular[index]['name'] != null
                                    ? _tvpopular[index]['name']
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
