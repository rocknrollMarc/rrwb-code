require 'test/unit'
require 'timer'

class TimerTest < Test::Unit::TestCase
  include Timer

  def test_missing_interval
    assert_raise RuntimeError do
      get_times 'duration' => "12", 'departure' => "5"
    end
  end

  def test_non_integer_interval
    assert_raise ArgumentError do
      get_times 'interval' => "fred", 'duration' => "12", 'departure' => "5"
    end
    assert_raise ArgumentError do
      get_times 'interval' => "fred 3", 'duration' => "12", 'departure' => "5"
    end
    assert_raise ArgumentError do
      get_times 'interval' => "3 fred 3", 'duration' => "12", 'departure' => "5"
    end
  end

  def test_non_positive_interval
    assert_raise RuntimeError do
      get_times 'interval' => "0", 'duration' => "12", 'departure' => "5"
    end
    assert_raise RuntimeError do
      get_times 'interval' => "-24", 'duration' => "12", 'departure' => "5"
    end
  end

  def test_missing_duration
    assert_raise RuntimeError do
      get_times 'interval' => "12", 'departure' => "5"
    end
  end

  def test_non_integer_duration
    assert_raise ArgumentError do
      get_times 'interval' => "3", 'duration' => "sally", 'departure' => "5"
    end
    assert_raise ArgumentError do
      get_times 'interval' => "3", 'duration' => "sally 12", 'departure' => "5"
    end
    assert_raise ArgumentError do
      get_times 'interval' => "3", 'duration' => "12sally", 'departure' => "5"
    end
  end

  def test_non_positive_duration
    assert_raise RuntimeError do
      get_times 'interval' => "3", 'duration' => "0", 'departure' => "5"
    end
    assert_raise RuntimeError do
      get_times 'interval' => "3", 'duration' => "-33", 'departure' => "5"
    end
  end

	def test_duration_not_a_multiple_of_interval
    assert_raise RuntimeError do
      get_times 'interval' => "27", 'duration' => "12", 'departure' => "5"
    end
	end

  def test_missing_departure
    assert_raise RuntimeError do
      get_times 'interval' => "3", 'duration' => "15"
    end
  end

  def test_non_integer_departure
    assert_raise ArgumentError do
      get_times 'interval' => "3", 'duration' => "12", 'departure' => "five"
    end
    assert_raise ArgumentError do
      get_times 'interval' => "3", 'duration' => "12", 'departure' => "five5"
    end
    assert_raise ArgumentError do
      get_times 'interval' => "3", 'duration' => "12", 'departure' => "5five"
    end
  end

  def test_non_positive_departure
    assert_raise RuntimeError do
      get_times 'interval' => "3", 'duration' => "15", 'departure' => "0"
    end
    assert_raise RuntimeError do
      get_times 'interval' => "3", 'duration' => "33", 'departure' => "-15"
    end
  end

	def test_departure_not_a_multiple_of_interval
    assert_raise RuntimeError do
      get_times 'interval' => "3", 'duration' => "12", 'departure' => "5"
    end
	end

end
