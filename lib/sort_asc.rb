# frozen_string_literal: true

# QuickSort algoritm, used in the current 'sort' ruby method,
# as almost all languages.

# Concept (divide et impera):
# The idea of quicksort is to pick the pivot (a random number) from the list,
# and basing on it's value, divide the list sorting into two groups:
# first group is the numbers less or equal than the pivot and
# second group is the numbers bigger than the pivot.
# In the subsequent iteration, with the recursive sort_asc calls,
# the less (and greater) will be separated in turn in less and greater with the
# evaluation of a new picked pivot. This untill the current array has just one
# element.

# complexity:
# O(n log n) in the average case: tempo linearitmico
# O(n2) worst case
class Array
  def sort_asc
    # avoid calculation if current array has
    # => equal elements: array.uniq.count
    # => just one or 0 elements: array.length < 2
    return self if length < 2 || uniq.count == 1

    pivot = last

    # remove the pivot because it generates a stack overflow issue because
    # it will be elaborated again in the next recursive calls
    delete_at(index(pivot))

    less = []
    greater = []

    each do |x|
      # compare each element of current array to the pivot and move them
      # to the less or greater according
      if x <= pivot
        less.push(x)
      else
        greater.push(x)
      end
    end

    # recursively sort the less array when last element is found, add the pivot
    # then sort the greater array to repeat the same operation
    (less.sort_asc + [pivot] + greater.sort_asc).flatten
  end
end
