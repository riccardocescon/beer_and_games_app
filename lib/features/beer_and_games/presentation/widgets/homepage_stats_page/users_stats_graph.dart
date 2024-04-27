part of 'package:beer_and_games/features/beer_and_games/presentation/pages/hangout_stats_page.dart';

class _UsersStatsGraph extends StatefulWidget {
  const _UsersStatsGraph({required this.users});

  final List<User> users;

  @override
  State<_UsersStatsGraph> createState() => _UsersStatsGraphState();
}

class _UsersStatsGraphState extends State<_UsersStatsGraph> {
  bool _showUserData = false;

  List<User> get sortedUsers {
    List<User> users = widget.users.toList();
    if (!_showUserData) {
      users = users.map((e) => e.copyWith(precenceCount: 0)).toList();
    }
    return users..sort((a, b) => a.email.compareTo(b.email));
  }

  double get _maxUsersPresence {
    return widget.users
        .map((e) => e.precenceCount ?? 0)
        .reduce((value, element) => value > element ? value : element)
        .toDouble();
  }

  int? _selectedIndex;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        _showUserData = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BarChart(
        BarChartData(
          minY: 0,
          maxY: _maxUsersPresence,
          alignment: BarChartAlignment.spaceEvenly,
          gridData: const FlGridData(show: false),
          borderData: _borderData(context),
          titlesData: _tilesData(context),
          barGroups: _usersData(context),
          barTouchData: _barTouchData(context),
        ),
        swapAnimationCurve: Curves.easeInOutCubic,
        swapAnimationDuration: const Duration(milliseconds: 700),
      );
    });
  }

  FlBorderData _borderData(BuildContext context) {
    return FlBorderData(
      border: Border(
        bottom: BorderSide(
          color: context.colorScheme.secondary,
          width: 2,
        ),
        left: BorderSide(
          color: context.colorScheme.secondary,
          width: 2,
        ),
      ),
    );
  }

  FlTitlesData _tilesData(BuildContext context) {
    return FlTitlesData(
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: AxisTitles(
        axisNameWidget: Text(
          'Serate',
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        sideTitles: SideTitles(
          interval: 2,
          showTitles: true,
          getTitlesWidget: (value, meta) {
            return SideTitleWidget(
              axisSide: meta.axisSide,
              child: Text(
                value.toInt().toString(),
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
        ),
      ),
      bottomTitles: AxisTitles(
        axisNameWidget: Text(
          'Persone',
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        axisNameSize: 25,
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 36,
          getTitlesWidget: (value, meta) {
            final index = value.toInt();
            final user = sortedUsers[index];
            final backgroundColor = index % 2 == 0
                ? context.colorScheme.primary
                : context.colorScheme.tertiary;
            final textColor = index % 2 == 0
                ? context.colorScheme.onPrimary
                : context.colorScheme.onTertiary;
            final opacity = _selectedIndex == null
                ? 1.0
                : _selectedIndex == index
                    ? 1.0
                    : 0.6;
            return SideTitleWidget(
              axisSide: meta.axisSide,
              child: CircleAvatar(
                backgroundColor: backgroundColor.withOpacity(opacity),
                child: Text(
                  user.letters,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: textColor.withOpacity(opacity),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  BarTouchData _barTouchData(BuildContext context) {
    return BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        fitInsideVertically: true,
        fitInsideHorizontally: true,
        tooltipPadding: const EdgeInsets.all(8),
        tooltipMargin: 8,
        getTooltipColor: (group) {
          final color = group.x % 2 == 0
              ? context.colorScheme.primary
              : context.colorScheme.tertiary;
          return color;
        },
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          final user = sortedUsers[group.x.toInt()];
          final textColor = group.x % 2 == 0
              ? context.colorScheme.onPrimary
              : context.colorScheme.onTertiary;
          return BarTooltipItem(
            user.email,
            TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: '\n${user.precenceCount}',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
      touchCallback: (event, response) {
        final allowTouch = event.isInterestedForInteractions &&
            response != null &&
            response.spot != null;

        if (allowTouch) {
          setState(() {
            _selectedIndex = response.spot!.touchedBarGroupIndex;
          });
        } else {
          setState(() {
            _selectedIndex = null;
          });
        }
      },
    );
  }

  List<BarChartGroupData> _usersData(BuildContext context) {
    return List.generate(
      sortedUsers.length,
      (index) {
        final exsistSelection = _selectedIndex != null;
        final isSelected = _selectedIndex == index;
        final color = index % 2 == 0
            ? context.colorScheme.primary
            : context.colorScheme.tertiary;
        final opacity = !exsistSelection
            ? 1.0
            : isSelected
                ? 1.0
                : 0.6;
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: sortedUsers[index].precenceCount?.toDouble() ?? 0,
              width: 16,
              color: color.withOpacity(opacity),
            ),
          ],
        );
      },
    );
  }
}
