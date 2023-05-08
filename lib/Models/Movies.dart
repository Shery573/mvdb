class Movies {
  String name;
  String id;
  String backDrop;
  String poster;
  String overView;
  String releaseDate;
  Movies({
    required this.name,
    this.id = '',
    required this.backDrop,
    required this.poster,
    required this.overView,
    required  this.releaseDate
  });
}
// }
// class Movies extends ListBase<Movies> {
//   final List<Movie> _movies = [];
//
//   @override
//   int get length => _movies.length;
//
//   @override
//   set length(int value) {
//     _movies.length = value;
//   }
//
//   @override
//   Movie operator [](int index) {
//     if (index >= _movies.length) {
//       return null;
//     }
//     return _movies[index];
//   }
//
//   @override
//   void operator []=(int index, Movies value) {
//     _movies[index] = value;
//   }
//
//   void addAll(List<Movies> movies) {
//     _movies.addAll(movies);
//   }
// }