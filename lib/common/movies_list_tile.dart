import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MoviesListTile extends StatefulWidget {
  final String title;
  final String genre;
  final String rating;
  final String image;

  const MoviesListTile({
    super.key,
    required this.title,
    required this.genre,
    required this.rating,
    required this.image,
  });

  @override
  State<MoviesListTile> createState() => _MoviesListTileState();
}

class _MoviesListTileState extends State<MoviesListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 2.w),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          colors: [
            Color(0xfff5f5f5),
            Color(0xffffffff),
          ],
          stops: [0.25, 0.75],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 130,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  // "Action | Adventure | Science",
                  widget.genre.split(",").join(" | "),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 1.5.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.5.w, vertical: .5.w),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "${widget.rating} IMDB",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
