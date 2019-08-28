# class DashboardController < ApplicationController
#   def index
#     @chart =
#       Fusioncharts::Chart.new(
#         {
#           width: '600',
#           height: '400',
#           type: 'doughnut2d',
#           renderAt: 'chartContainer',
#           dataSource: {
#             :"chart" => {
#               :"caption" => 'Party Analytics',
#               :"subcaption" => '',
#               :"showpercentvalues" => '1',
#               :"defaultcenterlabel" => 'music genres',
#               :"aligncaptionwithcanvas" => '0',
#               :"captionpadding" => '0',
#               :"decimals" => '1',
#               :"plottooltext" =>
#                 '<b>$percentValue</b> of our Android users are on <b>$label</b>',
#               :"centerlabel" => '# Users: $value',
#               :"theme" => 'fusion'
#             },
#             :"data" => [
#               { :"label" => 'Hip Hop', :"value" => '1000' },
#               { :"label" => 'Rock', :"value" => '5300' },
#               { :"label" => 'Regeton', :"value" => '10500' },
#               { :"label" => 'Dance', :"value" => '18900' },
#               { :"label" => 'Pop', :"value" => '17904' }
#             ]
#           }
#         }
#       )
#   end
# end

# <!-- <body>
# <h3>My Chart</h3>
# <%= @chart.render() %>
# </body>

#  -->
