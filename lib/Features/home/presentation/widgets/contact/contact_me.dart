import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact/contact_me_title.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact/soical_button.dart';
import 'package:portfolio/Utilities/Constants/global_keys.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Animation/animated_list.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/helper_function.dart';
import '../../../../../Utilities/portifilo_icons.dart';
import '../../../data/models/social_model.dart';

class ContactMeWidget extends StatelessWidget {
  const ContactMeWidget({
    super.key,
    this.padding = desktopHozPadding,
  });

  final double padding;

  Future<void> _sendEmail(String email) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  List<SocialModel> _socialLinks(
          BuildContext context, ProfileEntity? profile) =>
      [
        if (profile?.email != null)
          SocialModel(
            title: 'Email',
            icon: Portfolio.email,
            onPressed: () => _sendEmail(profile!.email!),
          ),
        if (profile?.phone != null)
          SocialModel(
            title: 'WhatsApp',
            icon: Portfolio.phone,
            onPressed: () => HelperFunctions.openWhatsApp(
              phoneNumber: profile!.phone!,
              message: 'Hi',
            ),
          ),
        if (profile?.linkedin != null)
          SocialModel(
            title: 'LinkedIN',
            icon: Portfolio.linkedIn,
            onPressed: () =>
                HelperFunctions.openUrl(profile!.linkedin!, context),
          ),
        if (profile?.github != null)
          SocialModel(
            title: 'Github',
            icon: Portfolio.github,
            onPressed: () => HelperFunctions.openUrl(profile!.github!, context),
          ),
        if (profile?.cv != null)
          SocialModel(
            title: 'Resume',
            icon: Portfolio.download,
            onPressed: () => HelperFunctions.openUrl(profile!.cv!, context),
          ),
      ];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final width = HelperFunctions.getWidth(context);
    return BlocSelector<PortfolioCubit, PortfolioState, ProfileEntity?>(
        selector: (s) => s.data?.profile,
        builder: (c, profile) {
          return Column(
            key: GlobalKeys.contactMe,
            spacing: 32,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCard(context, width, profile),
              Text(
                '© ${DateTime.now().year} Shorouk Fadl. All rights reserved.',
                style: AppTextStyles.l2(context: context, color: colors.text1),
              ).paddingSymmetric(horizontal: padding),
            ],
          );
        });
  }

  Widget _buildCard(
      BuildContext context, double width, ProfileEntity? profile) {
    final colors = context.colors;
    final buttons = _socialLinks(context, profile)
        .map((link) => SocialButtonWidget(
              title: link.title,
              icon: link.icon,
              size: 20,
              onPressed: link.onPressed,
            ))
        .toList();

    return Container(
      width: width,
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: padding / 2,
        vertical: 20,
      ),
      margin: EdgeInsetsGeometry.symmetric(horizontal: padding),
      decoration: BoxDecoration(
        color: colors.secondarySoft,
        border: Border.all(color: colors.secondary, width: 0.2),
        borderRadius: BorderRadius.circular(cardRadius),
      ),
      child: context.isLarge
          ? Row(
              spacing: 32,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const ContactMeTitle().expand,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: buttons
                      .map((e) => ScrollReveal(
                            axis: Axis.horizontal,
                            offset: 8,
                            index: buttons.indexOf(e),
                            child: e,
                          ))
                      .toList(),
                ),
              ],
            )
          : Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContactMeTitle(),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: buttons
                      .map((e) => ScrollReveal(
                            axis: Axis.horizontal,
                            offset: 8,
                            index: buttons.indexOf(e),
                            child: e,
                          ))
                      .toList(),
                ),
              ],
            ),
    );
  }
}
