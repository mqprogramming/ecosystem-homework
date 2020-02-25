require('minitest/autorun')
require('minitest/reporters')

MiniTest::Reporters.use!
MiniTest::Reporters::SpecReporter.new

require_relative('../bear')
require_relative('../fish')
require_relative('../river')

class EcosystemTest < MiniTest::Test

  def setup

    @fish1 = Fish.new("Mr. Fish")
    @fish2 = Fish.new("Sir Fishalot")
    @fish3 = Fish.new("HRH The Duke of Fishingham")

    @fishies = [@fish1, @fish2, @fish3]

    @river1 = River.new("Amazon", @fishies)

    @bear1 = Bear.new("Yogi", "Grizzly")

  end

  def test_river_has_name()

    assert_equal("Amazon", @river1.name())

  end

  def test_river_has_fish()

    assert_equal(3, @river1.fish.count())

  end

  def test_bear_has_properties()

    assert_equal("Yogi", @bear1.name())
    assert_equal("Grizzly", @bear1.type())

  end

  def test_bear_has_empty_stomach()

    assert_equal([], @bear1.stomach())

  end

  def test_bear_eats_fish()

    @bear1.stomach.push(@fish2)
    @river1.fish.delete(@fish2)

    assert_equal(2, @river1.fish.count())
    assert_equal(1, @bear1.stomach.count())

  end

  def test_roar()

    assert_equal("ROOOOOOOAAAAAAAARRRRR!!!!!!!", @bear1.roar())

  end

  def test_bear_food_count()

    @bear1.stomach.push(@fish3)
    assert_equal(1, @bear1.stomach.count())

  end

  def test_river_fish_count()

    assert_equal(3, @river1.fish.count())

  end

end
