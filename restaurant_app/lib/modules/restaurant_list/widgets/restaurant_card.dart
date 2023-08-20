import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_app/utils/shimmer_effect.dart';

import '../../../utils/theme/theme.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({Key? key,required this.pictureId,required this.name,required this.address, required this.rating,required this.onTap}) : super(key: key);
  final String? pictureId;
  final String? name;
  final String? address;
  final double? rating;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: elevation3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Hero(
                tag: name??"",
                child: CachedNetworkImage(
                  imageUrl:
                      "https://restaurant-api.dicoding.dev/images/small/$pictureId",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const SizedBox(
                    width: 100,
                    height: 100,
                    child: ShimmerEffect(),
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.image_not_supported),
                ),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name??"-",
                    style: text16PW600,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    children: [
                      Icon(Icons.pin_drop_outlined,color: primary,size: 16,),
                      const SizedBox(width: 8.0,),
                      Text(
                        address??"-",
                        style: text14PW500,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: rating??0,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 16.0,
                        direction: Axis.horizontal,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(rating.toString())
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
