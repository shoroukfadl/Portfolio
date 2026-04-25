import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/skills/skill_card.dart';



class SkillsSection extends StatefulWidget {
  final List<SkillEntity> skills;
  final double  shieldSize , orbitRadius ;
  const SkillsSection({super.key,  this.skills =const [],this.orbitRadius=160,this.shieldSize=160});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {





  @override
  Widget build(BuildContext context) {
    print('Skills  :: ${widget.skills.length}');
    return ListView.builder(
      itemCount: widget.skills.length,
      shrinkWrap: true,
      itemBuilder: (c,i)=>
       SkillCard(
          radius: widget.orbitRadius,
          skill: widget.skills[i],
          color: Colors.greenAccent,
          index: i,
        ),



    );
  }


}

// class SkillsSection extends StatefulWidget {
//   final List<TechnicalSkillEntity> skills;
//   final double  shieldSize , orbitRadius ;
//   const SkillsSection({super.key,  this.skills =const [],this.orbitRadius=160,this.shieldSize=160});
//
//   @override
//   State<SkillsSection> createState() => _SkillsSectionState();
// }
//
// class _SkillsSectionState extends State<SkillsSection>
//     with TickerProviderStateMixin {
//   late final AnimationController _orbitController;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _orbitController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 15),
//     )..repeat();
//
//
//   }
//
//   @override
//   void dispose() {
//     _orbitController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Row(
//       spacing: 40,
//       children: [
//         const ShieldWidget(),
//
//         Column(
//           spacing: 16,
//               children: [
//               ...List.generate(widget.skills.length, (i)=> SkillCard(
//                 radius: widget.orbitRadius,
//                 skill: widget.skills[i],
//                 color: Colors.greenAccent,
//                 index: i,
//               ),)
//
//
//               ],
//         ),
//
//       ],
//     );
//   }
//
//
// }