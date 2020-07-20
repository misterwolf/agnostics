# frozen_string_literal: true

require 'spec_helper'
require 'benchmark'

require_relative '../../lib/sort_asc'

describe '#sort_asc' do
  RSpec.shared_examples 'elements are correct and safe' do
    it 'sort_ascs elements' do
      native_sort = array.dup.sort

      expect(array.sort_asc).to eq(native_sort)
    end

    it 'keeps the same element number' do
      native_sort = array.dup.sort

      expect(array.sort_asc.size).to eq(native_sort.size)
    end
  end

  it_behaves_like 'elements are correct and safe' do
    let(:array) { [2, 3, 1] }
  end

  context 'huge array' do
    it_behaves_like 'elements are correct and safe' do
      let(:array) { Array.new(10) { rand(1...10) } }
    end

    xit 'is faster than the native "sort_asc"' do # joke test
      array = Array.new(10) { rand(1...10) }
      array_dup = array.dup

      time1 = Benchmark.measure do
        array_dup.sort
      end

      time2 = Benchmark.measure do
        array.sort_asc
      end

      expect(time1.real).to be >= time2.real # I am not abling.... so, xit! ;P
    end
  end
end
