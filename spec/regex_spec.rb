require 'spec_helper'

class SimpleRegex
  def initialize(expression)
    @expression = expression
  end

  def matches?(string)
    @expression[0] == string[0]
  end
end

describe SimpleRegex do
  context "single character" do
    let(:regex) { SimpleRegex.new("a") }

    it "matches the same character" do
      regex.should match("a")
    end
    
    it "doesn't match a different character" do
      regex.should_not match("b")
    end
  end
end