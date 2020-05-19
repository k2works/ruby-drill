# frozen_string_literal: true

# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative '../lib/chap01'

# アルゴリズムとは

## 3値の最大値
class TestMax < Minitest::Test
  def test_max3
    assert_equal 3, max3(3, 2, 1)
    assert_equal 3, max3(3, 2, 2)
    assert_equal 3, max3(3, 1, 2)
    assert_equal 3, max3(3, 2, 3)
    assert_equal 3, max3(2, 1, 3)
    assert_equal 3, max3(3, 3, 2)
    assert_equal 3, max3(3, 3, 3)
    assert_equal 3, max3(2, 2, 3)
    assert_equal 3, max3(2, 3, 1)
    assert_equal 3, max3(2, 3, 2)
    assert_equal 3, max3(1, 3, 2)
    assert_equal 3, max3(2, 3, 3)
    assert_equal 3, max3(1, 2, 3)
  end
end

## 条件判定と分岐
class TestJudgeSign < Minitest::Test
  def test_judge_sign
    assert_equal 'その値は正です。', judge_sign(17)
    assert_equal 'その値は負です。', judge_sign(-5)
    assert_equal 'その値は0です。', judge_sign(0)
  end
end

# 繰り返し

## 1からnまでの整数の総和を求める
class TestSum1ToN < Minitest::Test
  def test_sum_1_to_n_while
    assert_equal(15, sum_1_to_n_while(5))
  end

  def test_sum_1_to_n_for
    assert_equal(15, sum_1_to_n_for(5))
  end

  def test_sum_gauss
    assert_equal(15, sum_gauss(5))
  end
end

# 2値のソートと2値の交換
class TestSum < Minitest::Test
  def test_sum
    assert_equal 33, sum(3, 8)
    assert_equal 33, sum(8, 3)
  end
end

# 繰り返しの過程における条件判定（その１）
class TestSumVerbose < Minitest::Test
  def test_sum_verbose_1
    assert_equal '3 = 3', sum_verbose_1(3, 3)
    assert_equal '3 + 4 = 7', sum_verbose_1(3, 4)
    assert_equal '3 + 4 + 5 + 6 + 7 = 25', sum_verbose_1(3, 7)
  end

  def test_sum_verbose_2
    assert_equal '3 = 3', sum_verbose_2(3, 3)
    assert_equal '3 + 4 = 7', sum_verbose_2(3, 4)
    assert_equal '3 + 4 + 5 + 6 + 7 = 25', sum_verbose_2(3, 7)
  end
end

# 繰り返しの過程における条件判定（その２）
class TestAlternative < Minitest::Test
  def test_alternative_1
    assert_equal '+-+-+-+-+-+-', alternative_1(12)
  end

  def test_alternative_2
    assert_equal '+-+-+-+-+-+-', alternative_2(12)
  end
end

# 繰り返しの過程における条件判定（その３）
class TestPrintStars < Minitest::Test
  def test_print_stars_1
    assert_equal '*****\n*****\n****\n', print_stars_1(14, 5)
    assert_equal '*****\n*****\n*****\n', print_stars_1(15, 5)
  end

  def test_print_stars_2
    assert_equal '*****\n*****\n****\n', print_stars_2(14, 5)
    assert_equal '*****\n*****\n*****\n', print_stars_2(15, 5)
  end
end

# 正の値の読み込み
class TestSum1ToPositive < Minitest::Test
  def test_sum_1_to_positive
    assert_equal 55, sum_1_to_positive(10)
    assert_raises RuntimeError do
      sum_1_to_positive(-6)
    end
    assert_raises RuntimeError do
      sum_1_to_positive(0)
    end
  end
end

# 辺と面積が整数値である長方形
class TestRectangle < Minitest::Test
  def test_rectangle
    assert_equal '1x32 2x16 4x8 ', rectangle(32)
  end
end

class TestSkip < Minitest::Test
  def test_skip1
    assert_equal '1 2 3 4 5 6 7 9 10 11 12', skip1
  end

  def test_skip2
    assert_equal '1 2 3 4 5 6 7 9 10 11 12', skip2
  end
end

# 多重ループ

class TestMultiplicationTable < Minitest::Test
  def test_multiplication_table
    expect = <<~"EOS"
      ---------------------------
        1  2  3  4  5  6  7  8  9
        2  4  6  8 10 12 14 16 18
        3  6  9 12 15 18 21 24 27
        4  8 12 16 20 24 28 32 36
        5 10 15 20 25 30 35 40 45
        6 12 18 24 30 36 42 48 54
        7 14 21 28 35 42 49 56 63
        8 16 24 32 40 48 56 64 72
        9 18 27 36 45 54 63 72 81
      ---------------------------
    EOS

    assert_equal expect, multiplication_table
  end
end

# 直角三角形の表示

class TestTraiangle < Minitest::Test
  def test_traiangle_lb
    expect = <<~"EOS"
      *
      **
      ***
      ****
      *****
    EOS

    assert_equal expect, traiangle_lb(5)
  end

  def test_traiangle_rg
    expect = <<~"EOS"
          *
         **
        ***
       ****
      *****
    EOS

    assert_equal expect, traiangle_rg(5)
  end
end
