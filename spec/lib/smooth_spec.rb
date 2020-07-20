# frozen_string_literal: true

require 'spec_helper'
require 'benchmark'

require_relative '../../lib/smooth'

describe '#smooth' do
  context 'not applicable cases' do
    # empty, single element, each element is not array
    it 'returns original array' do
      expect([].smooth).to eq([])
      expect([1].smooth).to eq([1])
      expect(%w[1 2 3].smooth).to eq(%w[1 2 3])
    end
  end

  it 'returns smoothed array' do
    expect([1, [1]].smooth).to eq([1, 1]) # simpler

    # a bit complex
    expect(
      [1, [1, nil, [nil, nil], 1_000, [[[1], 1], 101_010], 1001], [111]].smooth
    ).to eq([1, 1, nil, nil, nil, 1000, 1, 1, 101_010, 1001, 111])

    expect([1, [4, 5], [2, [3, 4]]].smooth).to eq([1, 4, 5, 2, 3, 4]) # exercise
  end
end
