require 'spec_helper'

require 'facets/enumerable'

class SimpleRegex
  def initialize(expression)
    @expression = expression
  end

  def matches?(string)
    string.chars.to_a.each_index do |index|
      return true if matches_string?(string[index..-1])
    end
    false
  end

  def matches_string?(string)
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

    context "match at the start of the string" do
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
    
    context "match mid-way through the string" do
      it "matches a substring" do
        regex.should match("xyzabc")
      end
    end
  end
end