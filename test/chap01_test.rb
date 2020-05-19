# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative '../lib/chap01'

class MiniTestAdd < Minitest::Test
  def setup; end

  def test_add
    assert_equal 5, add(2, 2)
  end
end
