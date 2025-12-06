import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantapp/core/init/dependency_injection.dart';
import 'package:plantapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:plantapp/features/home/presentation/bloc/home_event.dart';
import 'package:plantapp/features/home/presentation/bloc/home_state.dart';
import 'package:plantapp/core/theme/app_spacings.dart';
import 'package:plantapp/core/theme/app_text_styles.dart';
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
                padding: EdgeInsets.only(top: AppSpacings.s16),
                sliver: SliverToBoxAdapter(child: HomeHeader(onSearchSubmitted: (query) {})),
              ),

              SliverToBoxAdapter(child: SizedBox(height: AppSpacings.s24)),
              SliverToBoxAdapter(child: HomePremiumCard(onTap: () {})),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacings.s24)),

              SliverToBoxAdapter(child: SizedBox(height: AppSpacings.s16)),

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
                        padding: AppSpacings.pagePaddingHorizontal,
                        itemBuilder: (context, index) => QuestionCard(question: state.questions[index]),
                        separatorBuilder: (context, index) => SizedBox(width: AppSpacings.s12),
                        itemCount: state.questions.length,
                      );
                    },
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: AppSpacings.s24)),

              // Categories Title
              SliverToBoxAdapter(
                child: Padding(
                  padding: AppSpacings.pagePaddingHorizontal,
                  child: Text(
                    'Categories',
                    style: AppTextStyles.sectionTitle,
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: AppSpacings.s16)),

              // Categories Grid
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.categories.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());

                  return SliverPadding(
                    padding: AppSpacings.pagePaddingHorizontal,
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: AppSpacings.s16,
                        crossAxisSpacing: AppSpacings.s16,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => CategoryCard(category: state.categories[index]),
                        childCount: state.categories.length,
                      ),
                    ),
                  );
                },
              ),

              SliverToBoxAdapter(child: SizedBox(height: AppSpacings.s24)),
            ],
          ),
        ),
      ),
    );
  }
}
