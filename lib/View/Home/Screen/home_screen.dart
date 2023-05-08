import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvdb/Utilities/Widgets/MovieTile.dart';
import 'package:mvdb/routes/app_routes.dart';

import '../../../Models/movieDetailArguments.dart';
import '../../Navigation Page/Controller/navPage_controller.dart';
import '../Controller/home_controller.dart';
// class Home extends StatelessWidget {
//   Home({Key? key}) : super(key: key);
//   var controller = Get.find<HomeController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber,
//       appBar: AppBar(
//
//         //backg roundColor: Colors.black,
//         actions: [
//           IconButton(
//             color: Colors.black,
//             onPressed: () {
//               // Navigator.of(context).pushNamed(MovieSearchScreen.routeName);
//             },
//             icon: const Icon(Icons.search),
//           )
//         ],
//
//         title: Text(
//           'Watch  ',
//           style: GoogleFonts.poppins(
//             color: Color(0xFF202C43),
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       body:
//       // OrientationBuilder(
//       //
//       //   builder: (context, orientation) {
//       //     final double deviceWidth = MediaQuery.of(context).size.width;
//       //     final double deviceHeight = MediaQuery.of(context).size.height;
//       //     final bool isPortrait = orientation == Orientation.portrait;
//       //     final double posterWidth =
//       //     isPortrait ? deviceWidth * 0.4 : deviceWidth * 0.25;
//
//
//                  Container(
//                   color: Colors.amber,
//                   height: 600,
//                   child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: ListView.builder(
//                         itemCount: 1,
//                           itemBuilder: (context,index)=>Text(''))
//                   ),
//                 )
//
//
//
//
//     );
//   }
// }
class Home extends StatelessWidget {
  final _scrollController = ScrollController();
  var controller = Get.find<HomeController>();
var navigationController=Get.find<NavPageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {
              navigationController.changeIndex(1);
            },
            icon: Icon(Icons.search),
          )
        ],
        title: Text(
          'Watch  ',
          style: GoogleFonts.poppins(
            color: Color(0xFF202C43),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  controller: _scrollController,
                  itemCount: controller.movies.length + 1,
                  itemBuilder: (context, index) {
                    if (index == controller.movies.length) {
                      controller.fetchMovies();
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final movie = controller.movies[index];
                    return Container(
                      height: MediaQuery.of(context).size.height*0.21,
                      width: MediaQuery.of(context).size.width*0.9,
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                        child: InkWell(
                          onTap: (){
                            Get.toNamed(
                              AppRoutes.movieDetails,
                              arguments: MovieDetailArguments(
                                movieId: movie.id,
                                releaseDate: movie.releaseDate,
                                title: movie.name,
                                overview: movie.overView,
                                picture: movie.backDrop,
                              ),
                            );
                          },
                            child: movieTile(movie.poster, movie.name, movie.releaseDate)));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}