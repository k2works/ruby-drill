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
  # >> judge_sign(17)
  # => 'その値は正です。'
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
# >> sum_1_to_n_for(5)
# => 15
def sum_1_to_n_for(n)
  sum = 0
  (1..n).each do |i|
    sum += i
  end
  sum
end

# ガウスの方法
#
# >> sum_gauss(5)
# => 15
def sum_gauss(n)
  n * (n + 1) / 2
end

# 2値のソートと2値の交換
class TestSum < Minitest::Test
  def test_sum
    assert_equal 33, sum(3, 8)
    assert_equal 33, sum(8, 3)
  end
end

# aからbまでの総和を求める
#
# >> sum(3, 8)
# => 33
def sum(a, b)
  a, b = b, a if a > b
  sum = 0
  (a..b).each do |i|
    sum += i
  end
  sum
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

# aからbまでの総和を求める
#
# >> sum_verbose_1(3, 4)
# => '3 + 4 = 7'
def sum_verbose_1(a, b)
  result = ''
  a, b = b, a if a > b
  sum = 0
  (a..b).each do |i|
    result += if i < b
                "#{i} + "
              else
                "#{i} ="
              end
    sum += i
  end
  result += " #{sum}"
end

# aからbまでの総和を求める
#
# >> sum_verbose_2(3, 4)
# => '3 + 4 = 7'
def sum_verbose_2(a, b)
  result = ''
  a, b = b, a if a > b
  sum = 0
  (a...b).each do |i|
    result += "#{i} + "
    sum += i
  end
  sum += b
  result += "#{b} = #{sum}"
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

# 記号文字+と-を交互に表示（その１）
#
# >> alternative_1(12)
# => '+-+-+-+-+-+-'
def alternative_1(n)
  result = ''
  (1..n).each do |i|
    result += if i.even?
                '-'
              else
                '+'
              end
  end
  result
end

# 記号文字+と-を交互に表示（その２）
#
# >> alternative_2(12)
# => '+-+-+-+-+-+-'
def alternative_2(n)
  result = ''
  (1..n / 2).each do |_|
    result += '+-'
  end
  result
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

# n個の記号文字*をw個ごとに改行しながら表示（その１）
def print_stars_1(n, w)
  result = ''
  (1..n).each do |i|
    result += '*'
    result += '\n' if (i % w).zero?
  end
  result += '\n' unless (n % w).zero?
  result
end

# n個の記号文字*をw個ごとに改行しながら表示（その２）
def print_stars_2(n, w)
  result = ''
  (1..n / w).each do |_i|
    result += '*' * w + '\n'
  end
  rest = n % w
  result += '*' * rest + '\n' unless rest.zero?
  result
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

# 1からnまでの総和を求めるのに正の整数値を読み込む
#
# >> sum_1_to_positive(10)
# => 55
def sum_1_to_positive(n)
  raise if n <= 0

  sum = 0
  (1..n).each do |i|
    sum += i
  end
  sum
end
