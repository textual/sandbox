$:.unshift(File.dirname(__FILE__))

require 'test/unit'
require 'common/common_mysql'


class FixtureMysqlTest < Test::Unit::TestCase
  def test_long_fixture
    assert(1,Polygon.from_coordinates([[[144.857742,13.598263], 
[144.862362,13.589922],[144.865169,13.587336],[144.862927,13.587665], 
[144.861292,13.587321],[144.857597,13.585299],[144.847845,13.573858], 
[144.846225,13.571014],[144.843605,13.566047],[144.842157,13.563831], 
[144.841202,13.561991],[144.838305,13.556465],[144.834645,13.549919], 
[144.834352,13.549395],[144.833825,13.548454],[144.831839,13.544451], 
[144.830845,13.54081],[144.821543,13.545695],[144.8097993,13.55186285], 
[144.814753,13.55755],[144.816744,13.56176944],[144.818862,13.566258], 
[144.819402,13.568565],[144.822373,13.572223], 
[144.8242032,13.57381149],[144.82634,13.575666],[144.83416,13.590365], 
[144.83514,13.595657],[144.834284,13.59652],[144.834024,13.598031], 
[144.83719,13.598061],[144.857742,13.598263]]]).to_fixture_format.split(/\s+/))
    
  end
end
