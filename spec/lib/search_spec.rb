# frozen_string_literal: true

require 'spec_helper'
require 'benchmark'

require_relative '../../lib/search'
require_relative '../../lib/sort_asc'

describe '#search' do
  let(:array) { %w[a b c] }

  it 'returns [index] if string is found' do
    expect(array.search('a')).to eq([0])
    expect(array.search('b')).to eq([1])
    expect(array.search('c')).to eq([2])
  end

  context 'not found cases' do
    it 'returns empty array' do
      expect(array.search(nil)).to eq([])
      expect(array.search('')).to eq([])
      expect(array.search('d')).to eq([])
    end
  end

  context 'complex data' do
    let(:array) do
      %w[
        Lorem ipsum dolor sit amet consectetur adipiscing elit sed do
        eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
        minim veniam quis nostrud exercitation ullamco laboris nisi ut
        aliquip ex ea commodo consequat. Duis aute irure dolor in
        reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
        pariatur. Excepteur sint occaecat cupidatat non proident sunt in
        culpa qui officia deserunt mollit anim id est laborum.
      ].sort_asc # using my personal sort!
    end

    it 'returns [indexes]' do
      expect(array.search('proident')).to eq([54])
    end

    it 'returns [indexes] if string is found multiple times' do
      expect(array.search('dolore')).to eq([21, 22])
    end
  end
end
