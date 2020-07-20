# frozen_string_literal: true

# simple search method
# return -1 in case array or item are nil, empty or in case item to found is
# not found.
# In case item is found one time, it returns the index, otherwise more indexes
# in array
# params
# => item: item to found
# returns
# => [indexes] when found one or more or [] for the other cases
class Array
  def search(item)
    return [] if item.nil? || item.empty?

    found = []

    each_with_index do |s, i|
      # a little performance improvements to avoid useless calculation:
      # because it's assumed that array is sorted, break interation if current
      # letter start with a letter > of the first letter of item:
      # hello == car, H > C
      break if s[0] > item[0]

      found << i if s == item
    end

    found
  end
end
