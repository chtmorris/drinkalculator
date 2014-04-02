new Morris.Bar({
    element: 'totalschart',
    data: [
      { year: 'Total beers', value: #{@total_beer} },
      { year: 'Total wine', value: #{@total_wine} },
      { year: 'Total cocktails', value: #{@total_cocktail} },
    ],
    xkey: 'year',
    ykeys: ['value'],
    labels: ['Value'],
    barColors: ['#999'],
    hideHover: true,
    gridTextSize: 16
  });

new Morris.Bar({
  element: 'costchart',
  data: [
    { year: 'Beer cost', value: #{@total_beer_cost} },
    { year: 'Wine cost', value: #{@total_wine_cost} },
    { year: 'Cocktails cost', value: #{@total_cocktail_cost} },
  ],
  xkey: 'year',
  ykeys: ['value'],
  labels: ['Value'],
  barColors: ['#808080'],
  hideHover: true,
  gridTextSize: 16
});

new Morris.Bar({
  element: 'unitchart',
  data: [
    { year: 'Beer unit', value: #{@total_beer_units} },
    { year: 'Wine unit', value: #{@total_wine_units} },
    { year: 'Cocktails unit', value: #{@total_cocktail_units} },
  ],
  xkey: 'year',
  ykeys: ['value'],
  labels: ['Value'],
  barColors: ['#656566'],
  hideHover: true,
  gridTextSize: 16
});