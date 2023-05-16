# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_push!
    stack = Stack.new

    element1 = 1
    expected_elements = [element1]
    stack.push!(element1)
    assert { stack.to_a == expected_elements }

    element2 = 2
    expected_elements = [element1, element2]
    stack.push!(element2)
    assert { stack.to_a == expected_elements }
  end

  def test_pop!
    stack = Stack.new [1, 2]

    expected_elements = [1]
    stack.pop!
    assert { stack.to_a == expected_elements }

    expected_result = 1
    assert { stack.pop! == expected_result }
  end

  def test_clear!
    stack = Stack.new [1, 2]

    expected_elements = []
    stack.clear!
    assert { stack.to_a == expected_elements }
  end

  def test_empty?
    stack = Stack.new
    assert { stack.empty? }

    stack.push!(1)
    refute { stack.empty? }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
