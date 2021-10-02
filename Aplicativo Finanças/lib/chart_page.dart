import 'package:flutter/material.dart';
import 'package:charts_common/common.dart' as chartsCo;
import 'package:charts_flutter/flutter.dart' as charts;
import 'finances.dart';

class ChartPage extends StatelessWidget {
  final Finance finance = Finance();
  final String seriesType; //Essential or non essential expense
  final bool animate;
  final Color color;

  ChartPage(this.seriesType, this.animate, this.color);

  //Converts from usual Color to charts_common Color to customize charts
  chartsCo.Color toChartColor(Color color) {
    return chartsCo.Color(
      a: color.alpha,
      r: color.red,
      g: color.green,
      b: color.blue,
    );
  }

  List<charts.Series<Expense, String>> _createSeries(String seriesType) {
    List<Expense> data = [];
    double totalExpenses = 0;
    String id = "";

    if (seriesType == "EssentialExpenses") {
      data = finance.eExpenses;
      totalExpenses = finance.totaleExpense;
      id = "Essential Expenses Percentages";
    } else if (seriesType == "NonEssentialExpenses") {
      data = finance.nExpenses;
      totalExpenses = finance.totalnExpense;
      id = "Non Essential Expenses Percentages";
    } else {
      print("Choose a valid series type");
    }

    return [
      //I think it takes the data and constructs the series from it,
      charts.Series<Expense, String>(
        id: id,
        colorFn: (_, __) => toChartColor(color), //Color from charts_common
        domainFn: (Expense expense, _) => expense.name,
        measureFn: (Expense expense, _) => expense.value * 100 / totalExpenses,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      _createSeries(seriesType),
      animate: animate,
      behaviors: [charts.SeriesLegend()],//Activate legends for the chart
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          labelStyle: charts.TextStyleSpec(
            color: charts.MaterialPalette.white,
          ),
        ),
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
          labelStyle: charts.TextStyleSpec(color: charts.MaterialPalette.white),
        ),
      ),
    );
  }
}