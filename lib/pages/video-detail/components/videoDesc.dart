import 'package:flutter/material.dart';

class VideoDesc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '剧情介绍：',
          style:
              TextStyle(fontSize: 14, height: 2, fontWeight: FontWeight.bold),
        ),
        Text(
          '         凯伦·吉兰(《复仇者联盟4》)、杨紫琼、琳娜·海蒂(《权力的游戏》)、安吉拉·贝塞特(《黑豹》）将联袂出演全女性卡司动作惊悚片《火药奶昔》，亚伦·凯莎莱斯和纳沃特·帕普莎多(《大坏狼》)执导，两人同EhudLavski编写剧本，金牌动作片制作人AndrewRona和AlexHeineman（《空中营救》《通勤营救》）担任制片。影片讲述了跨越三代人的女性杀手故事。斯嘉丽（海蒂饰）是一名专业杀手，为了保护幼女伊娃（吉兰饰）的安全，她将女儿托付给老友，隐姓埋名。多年后，伊娃走上了母亲的老路，成为冷血无情的刺客。在一次行动中，伊娃不慎让事态失控，令无辜的八岁小女孩陷入险境。伊娃于心不忍，为了救人，只能背叛组织。命运最终让母女重逢，她们联合其他退休的女杀手，一起向夺走了她们一切的杀手组织发起复仇ddd。命运最终让母女重逢，她们联合其他退休的女杀手，一起向夺走了她们一切的杀手组织发起复仇ddd。命运最终让母女重逢，她们联合其他退休的女杀手，一起向夺走了她们一切的杀手组织发起复仇ddd',
          style: TextStyle(
              fontSize: 12, height: 1.8, textBaseline: TextBaseline.alphabetic),
        )
      ],
    );
  }
}
