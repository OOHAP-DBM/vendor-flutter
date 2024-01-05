import 'package:oohapp/presentation/e_home_page/dashboard_screen/sale_chart/model/chart_sale_model.dart';

class ChartSaleData {
  List<SaleData> getChartData() {
    final List<SaleData> chartData = [
      SaleData(0.0, 'Day 1'),
      SaleData(30.0, 'Day 2'),
      SaleData(60.0, 'Day 3'),
      SaleData(90.0, 'Day 4'),
      SaleData(120.0, 'Day 5'),
      SaleData(150.0, 'Day 6'),
    ];
    return chartData;
  }
/*
  List<SaleData> getChartData() {
    // Get the current date
    DateTime currentDate = DateTime.now();

    // Generate data for the current month
    List<SaleData> data = [];
    for (int i = 0; i < 5; i++) {
      DateTime date = currentDate.add(Duration(days: i * 7));
      String formattedDate = '${date.day} ${getMonthName(date.month)}';
      double
      data.add(SaleData(((5 - i) * 30.0), formattedDate));
    }

    return data;
  }

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }*/
}
