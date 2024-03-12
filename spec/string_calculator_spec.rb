# frozen_string_literal: true

require 'rspec'
require './lib/string_calculator'
RSpec.describe StringCalculator do
  context 'with valid input' do
    it 'returns the sum of numbers' do
      expect(described_class.new.add("1,2,3")).to eq("6")
    end

    it 'handles negative numbers' do
      expect(described_class.new.add("-1,2,3,-4")).to eq("Negative numbers not allowed: [-1, -4]")
    end

    it 'handles new line delimiter' do
      expect(described_class.new.add("1\n2\n3")).to eq("6")
    end

    it 'handles custom delimiter' do
      expect(described_class.new.add("//;\n1;2;3")).to eq("6")
    end
  end

  context 'with invalid input' do
    it 'handles invalid input format' do
      expect(described_class.new.add("1,\n2")).to eq("Invalid input: '1,\n2'")
    end
  end
end
