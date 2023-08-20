import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:restaurant_app/modules/restaurant_detail/cubit/restaurant_detail_cubit.dart';
import 'package:restaurant_app/modules/review/page/create_review_page.dart';
import 'package:restaurant_app/utils/shimmer_effect.dart';
import 'package:restaurant_app/utils/sliver_persistent_header.dart';
import 'package:restaurant_app/utils/theme/theme.dart';

class RestaurantDetailView extends StatefulWidget {
  final String? id;

  const RestaurantDetailView({Key? key, required this.id}) : super(key: key);

  @override
  State<RestaurantDetailView> createState() => _RestaurantDetailViewState();
}

class _RestaurantDetailViewState extends State<RestaurantDetailView>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        // pinned: true,
        title: const Text("Detail Restoran"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateReviewPage(
                        id: widget.id,
                      ))).then((_) {
            setState(() {
              BlocProvider.of<RestaurantDetailCubit>(context)
                  .getRestaurantDetail(id: widget.id);
            });
          });
        },
        child: const Icon(
          Icons.rate_review_rounded,
          size: 24,
        ),
        backgroundColor: primary,
      ),
      body: BlocConsumer<RestaurantDetailCubit, RestaurantDetailState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is OnSuccessGetRestaurantDetail) {
            return NestedScrollView(
                headerSliverBuilder: (context, isScroll) {
                  return <Widget>[
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
                                      tag: state.data?.restaurant?.name ?? "",
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "https://restaurant-api.dicoding.dev/images/small/${state.data?.restaurant?.pictureId ?? ""}",
                                        width: 150,
                                        height: 200,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const SizedBox(
                                          width: 150,
                                          height: 200,
                                          child: ShimmerEffect(),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                                Icons.image_not_supported),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.data?.restaurant?.name ?? "",
                                        style: text16PW700,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.pin_drop_outlined,
                                            color: primary,
                                            size: 16,
                                          ),
                                          const SizedBox(
                                            width: 8.0,
                                          ),
                                          Text(
                                            state.data?.restaurant?.city ?? "",
                                            style: text14PW500,
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Row(
                                        children: [
                                          RatingBarIndicator(
                                            rating: state
                                                    .data?.restaurant?.rating ??
                                                0,
                                            itemBuilder: (context, index) =>
                                                const Icon(
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
                                          Text(
                                              (state.data?.restaurant?.rating ??
                                                      0)
                                                  .toString())
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(16),
                                                            topRight:
                                                                Radius.circular(
                                                                    16))),
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 4,
                                                          width: 40,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.grey,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        const SizedBox(
                                                          height: 16,
                                                        ),
                                                        Expanded(
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: List
                                                                    .generate(
                                                                        state.data?.restaurant?.customerReviews?.length ??
                                                                            0,
                                                                        (index) =>
                                                                            ListTile(
                                                                              title: Text(state.data?.restaurant?.customerReviews?[index].name ?? ""),
                                                                              subtitle: Text(state.data?.restaurant?.customerReviews?[index].review ?? "",maxLines: 2,overflow: TextOverflow.ellipsis),
                                                                              leading: const CircleAvatar(
                                                                                backgroundColor: primary,
                                                                                child: Icon(Icons.person),
                                                                              ),
                                                                            ))),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Text(
                                            "Lihat Review",
                                            style: text14PW400.copyWith(
                                                color: Colors.blue),
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              state.data?.restaurant?.description ?? "",
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
                            decoration: BoxDecoration(
                                boxShadow: elevation2, color: white),
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
                              (state.data?.restaurant?.menus?.foods ?? [])
                                  .length,
                              (index) => Card(
                                    elevation: 3,
                                    child: ListTile(
                                      title: Text(
                                        state.data?.restaurant?.menus
                                                ?.foods?[index].name ??
                                            "",
                                        style: text16PW400,
                                      ),
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
                              (state.data?.restaurant?.menus?.drinks ?? [])
                                  .length,
                              (index) => Card(
                                    elevation: 3,
                                    child: ListTile(
                                      title: Text(
                                        state.data?.restaurant?.menus
                                                ?.drinks?[index].name ??
                                            "",
                                        style: text16PW400,
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                    ),
                  ],
                ));
          }
          return const Center(
              child: SpinKitDualRing(
            color: primary,
            size: 24,
          ));
        },
      ),
    );
  }
}
