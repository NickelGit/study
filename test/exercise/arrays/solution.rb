module Exercise
  module Arrays
    class << self
      def max(array, max_value = array[0])
        max_value_acc = max_value
        return max_value_acc if array.empty?

        head, *rest = array
        max_value_acc = head if head > max_value_acc
        max(rest, max_value_acc)
      end

      def replace(array)
        max = max(array)
        array.map { |x| x.positive? ? max : x }
      end

      def search_step(array, query, left_search_border, right_search_border, search_index)
        current_element = array[search_index]
        return search_index if current_element == query
        return -1 if search_index == right_search_border || search_index == left_search_border

        if query > current_element
          left_search_border = search_index
          search_index += ((right_search_border - left_search_border) + 1) / 2
        else
          right_search_border = search_index
          search_index -= ((right_search_border - left_search_border) + 1) / 2
        end
        search_step(array, query, left_search_border, right_search_border, search_index)
      end

      def search(array, query)
        return -1 if array.empty?

        search_index = array.length / 2
        left_search_border = 0
        right_search_border = array.length - 1
        search_step(array, query, left_search_border, right_search_border, search_index)
      end
    end
  end
end
