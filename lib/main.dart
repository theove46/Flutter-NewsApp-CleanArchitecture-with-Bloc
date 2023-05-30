// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_api_clean_architecture_and_bloc/src/core/router/routes.dart';
// import 'package:your_project_name/data/datasources/news_api_provider.dart';
// import 'package:your_project_name/data/repositories/news_repository_impl.dart';
// import 'package:your_project_name/domain/repositories/news_repository.dart';
// import 'package:your_project_name/domain/usecases/get_top_headlines_usecase.dart';
// import 'package:your_project_name/presentation/bloc/news_bloc.dart';
// import 'package:your_project_name/presentation/pages/home_page.dart';
//
// void main() {
//   final newsApiProvider = NewsApiProvider();
//   final newsRepository = NewsRepositoryImpl(newsApiProvider);
//   final getTopHeadlinesUseCase = GetTopHeadlinesUseCase(newsRepository);
//   final newsBloc = NewsBloc(getTopHeadlinesUseCase);
//
//   runApp(MyApp(newsBloc));
// }
//
// class MyApp extends StatelessWidget {
//   final NewsBloc newsBloc;
//
//   const MyApp(this.newsBloc);
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //
//   //     home: BlocProvider.value(
//   //       value: newsBloc,
//   //       child: HomePage(),
//   //     ),
//   //   );
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => HomePageBloc(),
//         ),
//         BlocProvider(
//           create: (context) => DetailsPageBloc(),
//         ),
//       ],
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         onGenerateRoute: generateRoute,
//         home: HomePage(),
//       ),
//     );
//   }
// }
//
//

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
