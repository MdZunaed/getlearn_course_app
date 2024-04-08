import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getlearn_app/data/controllers/home_controller.dart';

import '../../data/models/course_model.dart';
import '../utility/app_colors.dart';
import '../utility/asset_path.dart';
import '../widgets/circle_button.dart';
import '../widgets/point_text.dart';

class SliverHomeScreen extends StatefulWidget {
  const SliverHomeScreen({super.key});

  @override
  State<SliverHomeScreen> createState() => _SliverHomeScreenState();
}

class _SliverHomeScreenState extends State<SliverHomeScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().getCourseData();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    Size mq = MediaQuery.sizeOf(context);
    List<String> courseIncludedImages = [docIcon, bookIcon, infinityIcon, certificateIcon];
    List<String> courseIncludedTexts = [
      "Support File",
      "10 Articles",
      "Full lifetime access",
      "Certificate of Completion"
    ];
    return Scaffold(
      //appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            leading: Padding(padding: const EdgeInsets.all(16), child: Image.asset(drawerIcon)),
            actions: [Padding(padding: const EdgeInsets.all(16), child: Image.asset(cartIcon))],
            title: const Text('Course Details'),
            centerTitle: true,
            expandedHeight: 70,
          ),
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Positioned(
                    // top: 0,
                    // left: 0,
                    // right: 0,
                    // height: mq.height * 0.15,
                    child: Container(height: 20, color: AppColors.primaryColor)),
                Positioned(
                  // top: mq.height * 0.12,
                  // left: 0,
                  // right: 0,
                  // bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                        color: AppColors.bgColor,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
                    child: GetBuilder<HomeController>(builder: (controller) {
                      Course? course = controller.courseData;
                      if (controller.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),

                            courseIntroSection(mq, course),

                            const SizedBox(height: 30),
                            Text(course?.title ?? 'Course Title', style: textTheme.titleLarge),
                            const SizedBox(height: 10),
                            Text(course?.subTitle ?? 'Course Subtitle', style: textTheme.bodyMedium),
                            const SizedBox(height: 10),

                            ratingSection(textTheme),

                            const SizedBox(height: 5),
                            Text("9591 Students", style: textTheme.bodySmall),
                            const SizedBox(height: 15),

                            mentor(textTheme),
                            const SizedBox(height: 10),

                            lastUpdate(textTheme),
                            const SizedBox(height: 10),

                            language(textTheme),

                            const SizedBox(height: 30),
                            Text("USD ${course?.price}", style: textTheme.headlineLarge),
                            const SizedBox(height: 10),

                            buyNowButton(mq),

                            const SizedBox(height: 15),

                            addToCartAndWishListButton(),

                            const SizedBox(height: 20),
                            Text("What you'll learn", style: textTheme.titleMedium),
                            //const SizedBox(height: 10),

                            learningTopic(course, textTheme),

                            const SizedBox(height: 20),
                            Text("Course Curriculum", style: textTheme.titleMedium),

                            courseLectureSection(course, textTheme),

                            const SizedBox(height: 20),

                            SizedBox(
                                width: mq.width,
                                child:
                                    OutlinedButton(onPressed: () {}, child: const Text("16 more section"))),
                            const SizedBox(height: 20),

                            Text("This Course Included", style: textTheme.titleMedium),
                            //const SizedBox(height: 10),
                            ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                itemCount: courseIncludedTexts.length,
                                itemBuilder: (context, index) => Row(children: [
                                      Image.asset(courseIncludedImages[index], height: 18),
                                      const SizedBox(width: 10),
                                      Text(courseIncludedTexts[index], style: textTheme.bodyLarge)
                                    ])),
                            const SizedBox(height: 20),

                            Text("Requirement", style: textTheme.titleMedium),
                            const SizedBox(height: 10),

                            PointText(text: course?.requirements ?? 'Requirement'),
                            const SizedBox(height: 20),

                            Text("Description", style: textTheme.titleMedium),
                            const SizedBox(height: 10),

                            ExpandableText(course?.description ?? 'Description',
                                expandText: 'Show more',
                                collapseText: 'Show less',
                                maxLines: 6,
                                linkColor: AppColors.primaryColor),
                            const SizedBox(height: 50),
                          ],
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container courseIntroSection(Size mq, Course? course) {
    return Container(
      height: 180,
      width: mq.width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: AppColors.cardColor, borderRadius: BorderRadius.circular(15)),
      //child: Image.network(course?.thumb ?? '', fit: BoxFit.cover),
      child: Stack(
        //fit: StackFit.expand,
        children: [
          Image.network(course?.thumb ?? '', height: 180, width: mq.width, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColors.primaryColor,
                AppColors.primaryColor,
                AppColors.primaryColor.withOpacity(0.1),
                Colors.transparent,
              ]),
            ),
          ),
          const Center(child: CircleButton())
        ],
      ),
    );
  }

  SizedBox buyNowButton(Size mq) {
    return SizedBox(
      width: mq.width,
      child: ElevatedButton(
        onPressed: () => Get.to(const SliverHomeScreen()),
        child: const Text("Buy Now"),
      ),
    );
  }

  ListView courseLectureSection(Course? course, TextTheme textTheme) {
    return ListView.separated(
      itemCount: course?.sections?.length ?? 0,
      primary: false,
      shrinkWrap: true,
      separatorBuilder: (c, i) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(course?.sections?[index].topic ?? '', style: textTheme.titleMedium),
          children: List.generate(
            course?.sections?[index].lessons?.length ?? 0,
            (i) => ListTile(
              leading: Image.asset(playIcon, height: 18),
              title: Text(course?.sections?[index].lessons?[i].lectureTitle ?? ''),
            ),
          ),
        );
      },
    );
  }

  Wrap language(TextTheme textTheme) {
    return Wrap(
      children: [
        const Icon(Icons.circle_outlined, size: 18),
        Text(" English", style: textTheme.bodySmall),
      ],
    );
  }

  Wrap lastUpdate(TextTheme textTheme) {
    return Wrap(
      children: [
        const Icon(Icons.edit_calendar, size: 18),
        Text(" Last update 06/2023", style: textTheme.bodySmall),
      ],
    );
  }

  Wrap mentor(TextTheme textTheme) {
    return Wrap(
      children: [
        Text("Mentor ", style: textTheme.bodyMedium),
        Text(
          "Ashutosh Pawar",
          style: textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  ListView learningTopic(Course? course, TextTheme textTheme) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: course?.learningTopic?.length ?? 0,
      itemBuilder: (context, index) {
        return PointText(text: course?.learningTopic?[index] ?? '');
      },
    );
  }

  Row addToCartAndWishListButton() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(onPressed: () {}, child: const Text("Add To Cart")),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: OutlinedButton(onPressed: () {}, child: const Text("Add To Wishlist")),
        ),
      ],
    );
  }

  Row ratingSection(TextTheme textTheme) {
    return Row(
      children: [
        Text("5.0", style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
        SizedBox(
          height: 20,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: false,
            children: List.generate(
              5,
              (index) => const Icon(Icons.star, color: Colors.amber, size: 18),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text("(2500)", style: textTheme.bodyMedium?.copyWith(color: Colors.grey)),
      ],
    );
  }

  Container appBarSection() {
    return Container(
      //height: 100,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: AppColors.primaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(drawerIcon, height: 18),
          const Text("Course Details",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: Colors.white)),
          Image.asset(cartIcon, height: 22),
        ],
      ),
    );
  }
}
