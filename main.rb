# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

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

# 3つの整数値を読み込んで最大値を求めて表示
#
# >> max3(1, 3, 2)
# => 3
def max3(a, b, c)
  maximum = a
  maximum = b if b > maximum
  maximum = c if c > maximum
  maximum
end

## 条件判定と分岐
class TestJudgeSign < Minitest::Test
  # 読み込んだ整数値の符号を表示
  #
  # >>> judge_sign(17)
  # ==> 'その値は正です。'
  def test_judge_sign
    assert_equal 'その値は正です。', judge_sign(17)
    assert_equal 'その値は負です。', judge_sign(-5)
    assert_equal 'その値は0です。', judge_sign(0)
  end
end

def judge_sign(n)
  return 'その値は正です。' if n.positive?
  return 'その値は負です。' if n.negative?
  return 'その値は0です。' if n.zero?
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

# while文による繰り返し
#
# >>> sum_1_to_n_while(5)
# ==> 15
def sum_1_to_n_while(n)
  sum = 0
  i = 1
  while i <= n
    sum += i
    i += 1
  end
  sum
end

# for文による繰り返し
#
# >>> sum_1_to_n_for(5)
# ===> 15
def sum_1_to_n_for(n)
  sum = 0
  (1..n).each do |i|
    sum += i
  end
  sum
end

# ガウスの方法
def sum_gauss(n)
  n * (n + 1) / 2
end
