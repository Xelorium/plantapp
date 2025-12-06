import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantapp/core/init/dependency_injection.dart';
import 'package:plantapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:plantapp/features/home/presentation/bloc/home_event.dart';
import 'package:plantapp/features/home/presentation/bloc/home_state.dart';
import 'package:plantapp/features/home/presentation/widgets/home/home_header.dart';
import 'package:plantapp/features/home/presentation/widgets/home/home_premium_card.dart';
import 'package:plantapp/features/home/presentation/widgets/home/question_card.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(const HomeEvent.started()),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 16.sp),
            children: [
              HomeHeader(
                onSearchSubmitted: (query) => log('Search submitted: $query'),
              ),

              SizedBox(height: 24.sp),
              HomePremiumCard(
                onTap: () {},
              ),

              SizedBox(height: 24.sp),

              // Questions Section
              SizedBox(
                height: 164.sp,
                width: double.infinity,
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.status == HomeStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.questions.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      itemBuilder: (context, index) => QuestionCard(question: state.questions[index], key: key),
                      separatorBuilder: (context, index) => SizedBox(width: 10.sp),

                      itemCount: state.questions.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
