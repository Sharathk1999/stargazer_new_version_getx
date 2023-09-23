import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

Widget collectionsHomePage(
    {required double width,
    required Color color,
    required String title,
    required String imgPath} // Add imgPath as a required parameter
    ) {
  return Stack(
    children: [
      // Container(
      //   clipBehavior: Clip.antiAlias,
      //   width: width * 24,
      //   height: width * 26,
      //   decoration: BoxDecoration(
      //     color: color,
      //     borderRadius: const BorderRadius.all(
      //       Radius.circular(50),
      //     ),
      //   ),
      //   child: Image.asset(
      //     imgPath,
      //     fit: BoxFit.cover, // Adjust the fit as needed
      //     width: width * 33,
      //     height: width * 6, // Adjust the height as needed
      //   ),
      //   // Add spacing between image and title
      // ),
      Container(
        width: width * 24,
        height: width * 26,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(39),
            topRight: Radius.circular(39),
            bottomLeft: Radius.circular(39),
            bottomRight: Radius.circular(39),
          ),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 4)
          ],
          border: Border.all(
            color: const Color.fromRGBO(0, 0, 0, 1),
            width: 1,
          ),
          image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
        ),
      ),
      Positioned(
        bottom: -2.5,
        left: 10.5,
        child: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: const Color.fromARGB(255, 249, 136, 136),
          child: Text(
            title,
            style: GoogleFonts.inconsolata(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
        ),
      ),
    ],
  );
}
