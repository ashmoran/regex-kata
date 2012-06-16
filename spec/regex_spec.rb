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
  subject { SimpleRegex.new(regex_body) }

  context "single character" do
    let(:regex_body) { "a" }

    it { should match("a") }
    it { should_not match("b") }
  end

  context "multiple characters" do
    let(:regex_body) { "abc" }

    context "match at the start of the string" do
      it { should match("abc") }
      it { should_not match("axc") }

      it { should match("abcd") }
      it { should_not match("ab") }
    end
    
    context "match mid-way through the string" do
      it { should match("xyzabc") }
    end
  end
end