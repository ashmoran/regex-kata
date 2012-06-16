require 'spec_helper'

class SimpleRegex
  def initialize(expression)
    @expression = expression
  end

  def matches?(string)
    @expression.chars.each_with_index do |element, index|
      return false unless element == string[index]
    end
  end
end

describe SimpleRegex do
  let(:regex) { SimpleRegex.new(regex_body) }

  context "single character" do
    let(:regex_body) { "a" }

    it "matches the same character" do
      regex.should match("a")
    end
    
    it "doesn't match a different character" do
      regex.should_not match("b")
    end
  end

  context "multiple characters" do
    let(:regex_body) { "abc" }

    it "matches the same character" do
      regex.should match("abc")
    end
    
    it "doesn't match a different character" do
      regex.should_not match("axc")
    end

    it "matches a string that contains extra characters at the end" do
      regex.should match("abcd")
    end
    
    it "doesn't match a string that is too short" do
      regex.should_not match("ab")
    end
  end
end