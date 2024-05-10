import 'package:beer_and_games/core/enums/rating.dart';
import 'package:flutter/material.dart';

extension RatingColorExt on Rating {
  Color get backgroundColor {
    switch (this) {
      case Rating.love:
        return const Color(0x14A00300);
      case Rating.like:
        return const Color(0x14C63000);
      case Rating.neutral:
        return const Color(0x14C6BE00);
      case Rating.dislike:
        return const Color(0x1493C600);
      case Rating.hate:
        return const Color(0x1404C600);
    }
  }

  Color get color {
    switch (this) {
      case Rating.love:
        return const Color(0xFFA00300);
      case Rating.like:
        return const Color(0xFFC63000);
      case Rating.neutral:
        return const Color(0xFFC6BE00);
      case Rating.dislike:
        return const Color(0xFF93C600);
      case Rating.hate:
        return const Color(0xFF04C600);
    }
  }
}

extension RatingImageExt on Rating {
  String get iconPath {
    switch (this) {
      case Rating.love:
        return 'assets/images/ratings/love.png';
      case Rating.like:
        return 'assets/images/ratings/like.png';
      case Rating.neutral:
        return 'assets/images/ratings/neutral.png';
      case Rating.dislike:
        return 'assets/images/ratings/dislike.png';
      case Rating.hate:
        return 'assets/images/ratings/hate.png';
    }
  }
}
