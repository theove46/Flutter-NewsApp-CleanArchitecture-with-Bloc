// ignore_for_file: use_build_context_synchronously, constant_identifier_names, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_clean_architecture_and_bloc/src/core/theme/colors.dart';
import 'package:news_api_clean_architecture_and_bloc/src/core/widgets/action_button.dart';
import 'package:news_api_clean_architecture_and_bloc/src/core/widgets/app_bar.dart';
import 'package:news_api_clean_architecture_and_bloc/src/core/widgets/shimer_effect.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/presentation/bloc/home_page_bloc.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/presentation/bloc/home_page_state.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/presentation/widgets/news_card.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/presentation/widgets/snack_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageBloc>().add(FetchHomePageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.redColor,
        title: const BBCAppBar(),
        actions: const [
          ActionButton(),
        ],
      ),
      body: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {
          if (state.status == HomePageStatus.error) {
            SnackBarShow(context, "Failed to load the news");
          }
        },
        builder: (context, state) {
          if (state.status == HomePageStatus.initial ||
              state.status == HomePageStatus.loading) {
            return const ShimerEffect();
          } else if (state.status == HomePageStatus.loaded) {
            final news = state.news;

            return ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                final newsItem = news[index];
                return NewsCard(news: newsItem);
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
