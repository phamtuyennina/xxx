import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as icons;
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../core/authentication_user/model/user_model.dart';
import '../../core/authentication_user/providers/auth_user_provider.dart';
import '../../shared/constants/api_url.dart';
import '../../shared/utils/helper.dart';
import '../account/account_screen.dart';
import '../notification/notification_screen.dart';
import '../products/products_screen.dart';
import '../shopping_cart/shopping_cart_screen.dart';
import 'providers/offset_scroll_provider.dart';

import '../../shared/constants/media_assets.dart';
import '../../shared/mixins/form_mixin.dart';
import '../../shared/mixins/ui_mixins.dart';
import '../product_category/product_category_screen.dart';
import '../product_detail/product_detail_screen.dart';
import '../search_products/search_product_screen.dart';

part 'widgets/header_home_widget.dart';
part 'widgets/search_home_widget.dart';
part 'widgets/body_home_widget.dart';
part 'widgets/slider_widget.dart';
part 'widgets/category_widget.dart';
part 'widgets/ad_widget.dart';
part 'widgets/product_home_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static const String nameRoute = 'home';
  static const String pathRoute = '/home';

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final double _showOffset = 500.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_listenerScrollController);
  }

  _listenerScrollController() {
    if (_scrollController.offset > _showOffset) {
      ref.read(offsetScrollProvider.notifier).update(true);
    } else {
      ref.read(offsetScrollProvider.notifier).update(false);
    }
  }

  _onGoTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            expandedHeight: 145,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewPadding.top + 20,
                    left: 20,
                    right: 20),
                child: const _HeaderHomeWidget(),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(12),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 10, top: 0),
                child: const _SearchHomeWidget(),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: _BodyHomeWidget(),
          ),
        ],
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return Visibility(
            visible: ref.watch(offsetScrollProvider),
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.white,
              onPressed: _onGoTop,
              child: Icon(
                Icons.vertical_align_top_rounded,
                size: 25,
                color: Theme.of(context).primaryColor,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
