import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/app_button.dart';
import '../../../common/responsive_text.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/value/dimension.dart';
import '../../../core/utils/extensions.dart';
import '../bloc/onbording_bloc.dart';
import '../bloc/onbording_event.dart';
import '../bloc/onbording_state.dart';

class OnbordingContent {
  final String svgPath;
  final String welcomeLabel;
  final String title;
  final String description;

  const OnbordingContent({
    required this.svgPath,
    required this.welcomeLabel,
    required this.title,
    required this.description,
  });
}

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnbordingBloc>(
      create: (context) => OnbordingBloc(),
      child: const _OnbordingView(),
    );
  }
}

class _OnbordingView extends StatefulWidget {
  const _OnbordingView();

  @override
  State<_OnbordingView> createState() => _OnbordingViewState();
}

class _OnbordingViewState extends State<_OnbordingView> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;

  final List<OnbordingContent> _contents = const [
    OnbordingContent(
      svgPath: 'assets/icons/Course.svg',
      welcomeLabel: 'WELCOME',
      title: 'Skills that get you hired — not just certified.',
      description:
          'Marketing, AI, code, data and business — taught by people doing the work today.',
    ),
    OnbordingContent(
      svgPath: 'assets/icons/Programming.svg',
      welcomeLabel: 'PRACTICAL LEARNING',
      title: 'Learn by doing with real-world projects.',
      description:
          'Build professional portfolios and gain hands-on experience under the mentorship of industry experts.',
    ),
    OnbordingContent(
      svgPath: 'assets/icons/Webinar.svg',
      welcomeLabel: 'LIVE SESSIONS',
      title: 'Interactive cohorts and live webinars.',
      description:
          'Connect with peers, participate in live Q&A sessions, and grow your professional network.',
    ),
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToPage(int page) {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        page * MediaQuery.of(context).size.width,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    final backgroundColor = isDark
        ? AppColors.scaffoldBackgroundDark
        : AppColors.scaffoldBackgroundLight;
    final headingColor = isDark ? Colors.white : AppColors.primary;
    final bodyColor = isDark ? AppColors.textSecondary : AppColors.neutral;

    return BlocListener<OnbordingBloc, OnbordingState>(
      listener: (context, state) {
        if (state.isCompleted) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.login);
        } else if (state.pageIndex != _currentPage) {
          setState(() {
            _currentPage = state.pageIndex;
          });
          _scrollToPage(state.pageIndex);
        }
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              // Sliding Content
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification notification) {
                    if (notification is ScrollEndNotification) {
                      final double width =
                          notification.metrics.viewportDimension;
                      final int page = (notification.metrics.pixels / width)
                          .round();
                      if (page != _currentPage &&
                          page >= 0 &&
                          page < _contents.length) {
                        setState(() {
                          _currentPage = page;
                        });
                        context.read<OnbordingBloc>().add(
                          OnbordingPageChanged(page),
                        );
                      }
                    }
                    return true;
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const PageScrollPhysics(),
                    itemCount: _contents.length,
                    itemBuilder: (context, index) {
                      final item = _contents[index];
                      return Container(
                        width: screenWidth,
                        padding: AppPaddings.symmetric(h: 24),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacing.h(24),

                                // SVG Illustration Card Container
                                Container(
                                  height: 280.h,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    item.svgPath,
                                    fit: BoxFit.contain,
                                    height: 260.h,
                                    placeholderBuilder:
                                        (BuildContext context) => const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                  ),
                                ),

                                Spacing.h(32),

                                // Welcome/Category Label
                                ResponsiveText.bodySmall(
                                  item.welcomeLabel,
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.center,
                                ),
                                Spacing.h(12),

                                // Main Title
                                ResponsiveText.title(
                                  item.title,
                                  color: headingColor,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.bold,
                                ),
                                Spacing.h(16),

                                // Subtitle/Description
                                Padding(
                                  padding: AppPaddings.symmetric(h: 12),
                                  child: ResponsiveText.bodyMedium(
                                    item.description,
                                    color: bodyColor,
                                    textAlign: TextAlign.center,
                                  ),
                                ),

                                Spacing.h(24),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Bottom Actions and Page Indicator
              Padding(
                padding: AppPaddings.only(
                  left: 24,
                  right: 24,
                  bottom: 24,
                  top: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Skip Button (Visible on first two pages)
                    SizedBox(
                      width: 80.w,
                      child: _currentPage < _contents.length - 1
                          ? AppButton.text(
                              text: 'Skip',
                              textColor: bodyColor,
                              onPressed: () {
                                context.read<OnbordingBloc>().add(
                                  const OnbordingSkipPressed(),
                                );
                              },
                            )
                          : Spacing.empty,
                    ),

                    // Dot Indicators
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        _contents.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          height: 8.h,
                          width: _currentPage == index ? 24.w : 8.w,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? AppColors.secondary
                                : (isDark
                                      ? AppColors.neutralVariant
                                      : AppColors.neutralLight.withValues(
                                          alpha: 0.4,
                                        )),
                            borderRadius: AppRadius.all(4),
                          ),
                        ),
                      ),
                    ),

                    // Next / Let's Go Button
                    SizedBox(
                      width: 100.w,
                      child: AppButton.primary(
                        text: _currentPage == _contents.length - 1
                            ? 'Start'
                            : 'Next',
                        backgroundColor: AppColors.secondary,
                        onPressed: () {
                          context.read<OnbordingBloc>().add(
                            const OnbordingNextPressed(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
