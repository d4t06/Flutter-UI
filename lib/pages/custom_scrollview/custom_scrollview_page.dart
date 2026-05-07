import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/components/app_async_value_view.dart';
import 'package:my_app/components/app_sidebar.dart';
import 'package:my_app/components/app_top_bar.dart';
import 'package:my_app/pages/riverpod/providers/async_product_provider.dart';
// import 'package:my_app/pages/riverpod/providers/sync_product_provider.dart';
import 'package:my_app/pages/riverpod/widgets/product_card_item.dart';
import 'package:my_app/theme/theme.dart';

class CustomScrollviewPage extends ConsumerWidget {
  const CustomScrollviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final products = ref.read(syncProductProvider);
    final state = ref.watch(asyncProductProvider);

    return Scaffold(
      appBar: AppTopBar(title: "Custom Srollview"),
      drawer: AppSidebar(),

      body: AppAsyncValueView(
        value: state,
        data: (products) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(asyncProductProvider);
              await ref.read(asyncProductProvider.future);
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  // remote menu/ back icon from Scaffold
                  automaticallyImplyLeading: false,
                  expandedHeight: 360,
                  backgroundColor: context.colors.primary,
                  foregroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    stretchModes: const [
                      StretchMode.zoomBackground,
                      StretchMode.fadeTitle,
                    ],
                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.people,
                            size: 50,
                            color: context.colors.primary,
                          ),
                        ),
                        Center(child: Text("asdflasj")),
                      ],
                    ),
                  ),
                ),

                SliverAppBar(
                  expandedHeight: 140,
                  toolbarHeight: 140,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: EdgeInsets.all(context.spacing.md),
                      child: Column(
                        children: [
                          Text("Pined toolbar"),
                          SizedBox(height: context.spacing.s2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: context.colors.primary,
                                    child: Icon(Icons.place),
                                  ),
                                  Text("Click"),
                                ],
                              ),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: context.colors.primary,
                                    child: Icon(Icons.place),
                                  ),
                                  Text("Click"),
                                ],
                              ),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: context.colors.primary,
                                    child: Icon(Icons.place),
                                  ),
                                  Text("Click"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Text(
                    "Normal widget inside CustomScrollView",
                    style: context.text.textXl.bold,
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: context.spacing.s2)),

                SliverList(
                  delegate: SliverChildListDelegate([
                    ...products
                        .map((item) => ProductCardItem(item: item))
                        ,
                  ]),
                ),

                SliverFillRemaining(),
              ],
            ),
          );
        },
      ),
    );
  }
}
