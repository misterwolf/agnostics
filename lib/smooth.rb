# frozen_string_literal: true

# Smooth array
# Elements existing in an array element are moved in the parent, recoursively
class Array
  def smooth
    return self if empty?

    smoothed = []

    each do |el|
      if el.is_a?(Array)
        # Array could contain "infinite" arrays.
        # Let's iterate them all, recoursively.
        smoothed += el.smooth
      else
        smoothed << el
      end
    end

    smoothed
  end
end
