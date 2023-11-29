import 'package:flutter/material.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:fl_chart/fl_chart.dart';

class oneGraph extends StatelessWidget {
    final double carbPercentage;
    final double fatPercentage;
    final double proteinPercentage;

    oneGraph({
            required this.carbPercentage,
            required this.fatPercentage,
            required this.proteinPercentage,
        });

    Widget build(BuildContext context) {
        return PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                color: Palette.tanSu,
                value: carbPercentage,
                title: '탄수화물',
                radius: 80,
              ),
              PieChartSectionData(
                color: Palette.danBaek,
                value: proteinPercentage,
                title: '단백질',
                radius: 80,
              ),
              PieChartSectionData(
                color: Palette.jiBang,
                value: fatPercentage,
                title: '지방',
                radius: 80,
              ),
            ],
          ),
        );
      }

    }