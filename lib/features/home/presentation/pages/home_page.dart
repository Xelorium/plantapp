import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/core/init/dependency_injection.dart';
import 'package:plantapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:plantapp/features/home/presentation/bloc/home_event.dart';
import 'package:plantapp/features/home/presentation/bloc/home_state.dart';
import 'package:plantapp/features/home/presentation/widgets/home/category_card.dart';
import 'package:plantapp/features/home/presentation/widgets/home/home_header.dart';
import 'package:plantapp/features/home/presentation/widgets/home/home_premium_card.dart';
import 'package:plantapp/features/home/presentation/widgets/home/question_card.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(const HomeEvent.started()),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(top: 16.sp),
                sliver: SliverToBoxAdapter(child: HomeHeader(onSearchSubmitted: (query) {})),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 24.sp)),
              SliverToBoxAdapter(child: HomePremiumCard(onTap: () {})),
              SliverToBoxAdapter(child: SizedBox(height: 24.sp)),

              // Questions Section
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 164.sp,
                  width: double.infinity,
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.status == HomeStatus.loading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state.questions.isEmpty) return const SizedBox.shrink();

                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        itemBuilder: (context, index) => QuestionCard(question: state.questions[index]),
                        separatorBuilder: (context, index) => SizedBox(width: 10.sp),
                        itemCount: state.questions.length,
                      );
                    },
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 24.sp)),

              // Categories Grid
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.categories.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());

                  return SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.sp,
                        crossAxisSpacing: 16.sp,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => CategoryCard(category: state.categories[index]),
                        childCount: state.categories.length,
                      ),
                    ),
                  );
                },
              ),

              SliverToBoxAdapter(child: SizedBox(height: 24.sp)),
            ],
          ),
        ),
      ),
    );
  }
}
