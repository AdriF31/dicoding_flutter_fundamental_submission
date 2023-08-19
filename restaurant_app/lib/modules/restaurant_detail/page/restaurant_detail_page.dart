import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'package:restaurant_app/utils/shimmer_effect.dart';
import 'package:restaurant_app/utils/sliver_persistent_header.dart';
import 'package:restaurant_app/utils/theme/theme.dart';

class RestaurantDetailPage extends StatefulWidget {
  const RestaurantDetailPage(
      {Key? key, required this.data, required this.index})
      : super(key: key);
  final RestaurantModel data;
  final int index;

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var foods = widget.data.restaurants[widget.index].menus.foods;
    var drinks = widget.data.restaurants[widget.index].menus.drinks;
    return Scaffold(
      backgroundColor: white,
      body: NestedScrollView(
          headerSliverBuilder: (context, isScroll) {
            return <Widget>[
              const SliverAppBar(
                pinned: true,
                title: Text("Detail Restoran"),
                centerTitle: true,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: elevation2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Hero(
                                tag: widget.data.restaurants[widget.index]
                                    .name,
                                child: CachedNetworkImage(
                                  imageUrl: widget.data.restaurants[widget.index]
                                          .pictureId,
                                  width: 150,
                                  height: 200,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const SizedBox(
                                    width: 150,
                                    height: 200,
                                    child: ShimmerEffect(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.image_not_supported),
                                ),
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
                                  widget.data.restaurants[widget.index].name,
                                  style: text16PW700,
                                  maxLines: 2,
                                ),
                                const SizedBox(height: 8.0,),
                                Row(
                                  children: [
                                    const Icon(Icons.pin_drop_outlined,color: primary,size: 16,),
                                    const SizedBox(width: 8.0,),
                                    Text(
                                      widget.data.restaurants[widget.index].city ,
                                      style: text14PW500,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8.0,),
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: widget
                                              .data
                                              .restaurants[widget.index]
                                              .rating,
                                      itemBuilder: (context, index) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 16.0,
                                      direction: Axis.horizontal,
                                    ),
                                    const SizedBox(width: 8.0,),
                                    Text(widget
                                        .data.restaurants[widget.index].rating
                                        .toString())
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        widget.data.restaurants[widget.index].description,
                        style: text16PW400,
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppBarDelegate(
                    minHeight: kToolbarHeight,
                    maxHeight: kToolbarHeight,
                    child: Container(
                      decoration:
                          BoxDecoration(boxShadow: elevation2, color: white),
                      child: TabBar(
                          controller: _controller,
                          indicatorColor: primary,
                          labelStyle: text14PW700,
                          tabs: const [
                             Tab(
                              child: Text(
                                'Makanan',
                                style: text16PW700,
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Minuman',
                                style: text16PW700,
                              ),
                            ),
                          ]),
                    )),
              ),
            ];
          },
          body: TabBarView(
            controller: _controller,
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        foods.length, (index) => Card(
                      elevation: 3,
                      child: ListTile(
                        title: Text(foods[index].name,style: text16PW400,),
                      ),
                    )),
                  ),
                ),
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        drinks.length, (index) => Card(
                      elevation: 3,
                          child: ListTile(
                      title: Text(drinks[index].name,style: text16PW400,),
                    ),
                        )),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
