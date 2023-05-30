import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_clean_architecture_and_bloc/src/core/router/routes.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/detailspage/presentation/bloc/details_page_bloc.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/data/datasources/homepage_datasource.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/data/repositories/homepage_repository_implementation.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/usecases/homepage_usecase.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/presentation/bloc/home_page_bloc.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/presentation/views/home_page_view.dart';

void main() {
  final homePageDataSource = HomePageDataSourceImpl();
  final homePageRepository = HomePageRepositoryImpl(homePageDataSource);
  final homePageUseCase = HomePageUseCase(homePageRepository);
  final homePageBloc = HomePageBloc(homePageUseCase);

  runApp(MyApp(homePageBloc));
}

class MyApp extends StatelessWidget {
  final HomePageBloc homePageBloc;

  const MyApp(this.homePageBloc, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => homePageBloc,
        ),
        BlocProvider(
          create: (context) => DetailsPageBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: generateRoute,
        home: HomePage(),
      ),
    );
  }
}
