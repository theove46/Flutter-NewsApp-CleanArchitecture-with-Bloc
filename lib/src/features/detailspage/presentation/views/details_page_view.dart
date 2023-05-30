import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_api_clean_architecture_and_bloc/src/core/theme/colors.dart';
import 'package:news_api_clean_architecture_and_bloc/src/core/widgets/action_button.dart';
import 'package:news_api_clean_architecture_and_bloc/src/core/widgets/app_bar.dart';
import 'package:news_api_clean_architecture_and_bloc/src/core/widgets/text_style.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/detailspage/presentation/bloc/details_page_bloc.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/entities/homepage_entity.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/presentation/widgets/snack_bar.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.news}) : super(key: key);
  final HomePageEntity news;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<DetailsPageBloc>().add(FetchDetailsPageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.redColor,
        automaticallyImplyLeading: false,
        title: const BBCAppBar(),
        actions: const [
          ActionButton(),
        ],
      ),
      body: BlocConsumer<DetailsPageBloc, DetailsPageState>(
        listener: (context, state) {
          if (state is DetailsPageErrorState) {
            SnackBarShow(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is DetailsPageInitialState ||
              state is DetailsPageLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DetailsPageLoadedState) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          widget.news.urlToImage,
                          height: 160,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 6,
                          right: 6,
                          child: SizedBox(
                            height: 70,
                            width: 70,
                            child: Image.network(
                              'https://download.logo.wine/logo/BBC_News/BBC_News-Logo.wine.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    BoldText(
                      text: widget.news.title,
                      size: 24,
                    ),
                    const SizedBox(height: 8),
                    BoldText(
                      text: 'Author: ${widget.news.author}',
                      size: 16,
                    ),
                    const SizedBox(height: 8),
                    BoldText(
                      text:
                          'Published at: ${DateFormat('dd/MM/yy').format(widget.news.publishedAt)}',
                      size: 16,
                    ),
                    const SizedBox(height: 8),
                    PlainText(
                      text: widget.news.description,
                      size: 16,
                    ),
                    const SizedBox(height: 8),
                    BoldText(
                      text: 'Source: ${widget.news.source.name}',
                      size: 16,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
