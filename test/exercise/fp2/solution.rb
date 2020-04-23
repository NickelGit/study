module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(array = self, &func)
        return MyArray.new(array) if empty?

        head, *rest = self
        func.call(head)
        MyArray.new(rest).my_each(array, &func)
      end

      # Написать свою функцию my_map
      def my_map(array = [], &func)
        return MyArray.new(array) if empty?

        head, *rest = self
        array << func.call(head)
        MyArray.new(rest).my_map(array, &func)
      end

      # Написать свою функцию my_compact
      def my_compact
        result_array = []
        func = ->(element) { result_array << element unless element.nil? }
        my_each(&func)
        MyArray.new(result_array)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &func)
        return acc if empty?

        head, *rest = self
        acc = acc.nil? ? head : func.call(acc, head)
        MyArray.new(rest).my_reduce(acc, &func)
      end
    end
  end
end
