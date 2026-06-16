import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/images/Gallery/gallery_preview.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/mobile_preview.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/platform_button.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/web_preview.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Portfilio/divider_widget.dart';
import '../../../../../../Utilities/Constants/constants.dart';
import '../../../../../../Utilities/Constants/enums.dart';
import '../../../../domain/entities/project_entity.dart';
import 'badge_chip.dart';

class ProjectCard extends StatelessWidget {
  final ProjectEntity project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    bool mobile =  project.projectType?.toLowerCase() ==
        PreviewType.mobile.name;
    return AnimatedCardWidget(
      paddingVert: 8,
      paddingHoz: 8,
      child:(h)=> Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Preview
          Stack(
            children: [
              SizedBox(
                height: 170,
                width: double.infinity,
                child: mobile ? MobilePreview(url: project.images.firstOrNull ?? '',)
                    : WebPreview(
                  height: 170,
                  width: double.infinity,
                        url: project.images.firstOrNull ?? '',
                        logoText: project.projectName ?? '',
                      ),
              ),
              if(h)
              Container(
                height: 170,
                width: double.infinity,
                alignment: AlignmentDirectional.center,
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.all( Radius.circular(Constants.cardRadius)),
                  color: Colors.black.withValues(alpha: 0.1),
                ),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    onTap: (){
                      GalleryPreviewDialog.show(context,isMobile: mobile, images: project.images,title: project.projectName??"");
                    },
                    child: CardWithText(
                      borderColor:Colors.transparent ,
                        color: colors.card,
                      text: "Gallery",
                      style: AppTextStyles.titleCardSmall(
                        context: context,
                        color: colors.text1
                      ),),
                  ),

                ),
              )
            ],
          ),

          // Body
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 8,
                children: [
                  Text(
                    project.projectName ?? "",
                    style: AppTextStyles.titleCard(context:context,color: colors.text1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ).expand,
                  CardWithText(text:project.company?.toUpperCase() ?? "",
                      color:colors.secondary.withValues(alpha: 0.2),
                      borderColor: Colors.transparent,
                      style: AppTextStyles.subtitleCard(context:context,color: colors.secondary)),
                ],
              ),
              if (project.content.isNotEmpty)
                ...project.content
                    .map((e) => Text(
                          e,
                          style: AppTextStyles.cardBody(context:context,color: colors.text3),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ))

            ],
          ).expand,

          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              if(project.androidLinks.isNotEmpty)
              PlatformButton(
                links: project.androidLinks,
                type: PlatformType.android,
              ),
              if(project.iosLinks.isNotEmpty)
              PlatformButton(
                links: project.iosLinks,
                type: PlatformType.ios,
              ),
              if(project.webLinks.isNotEmpty)
              PlatformButton(
                links: project.webLinks,
                type: PlatformType.web,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
