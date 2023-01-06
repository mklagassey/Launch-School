# Just playing around

# def substring(string)
#   sample_length = string.size
#   sample_index = 0
#   substring_array = []
#
#   loop do
#     break if sample_length < 2
#     loop do
#       substring_array << string[sample_index, sample_length]
#       sample_index += 1
#       break if sample_index + sample_length > string.size
#     end
#     sample_length -= 1
#     sample_index = 0
#   end
#   substring_array
# end
#
# p substring("wesson")

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }
#
# def select_fruit(hash)
#   hash.select { |k, v| v == 'Fruit'}
# end
#
# p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# def double_numbers!(numbers)
#   counter = 0
#
#   loop do
#     break if counter == numbers.size
#
#     numbers[counter] *= 2
#
#     counter += 1
#   end
# end
#
# my_numbers = [1, 4, 3, 7, 2, 6]
# double_numbers!(my_numbers)
# p my_numbers

# Try coding a solution that doubles the numbers that have odd indices

# def dbl_odd_ind(arr, multiplier)
#   counter = 0
#   doubled_nums = []
#
#   loop do
#     break if counter == arr.size
#
#     current_num = arr[counter]
#     current_num *= multiplier if counter.odd?
#     doubled_nums << current_num
#
#     counter += 1
#   end
#
#   doubled_nums
# end
#
# my_numbers = [1, 4, 3, 7, 2, 6]
# p dbl_odd_ind(my_numbers, 3)
# p my_numbers

# arr1 = {3 => "lion", 4 => "wolf", f: "shark"}
# hash = {1 => "cat", 2 => "dog", c: "fish"}
#
# hash.each_with_object(arr1) do |(k, v), arg_obj|
#   arg_obj[k] = v if k.class == Integer
# end
#
# p arr1
# p hash

ages = {bob: 40, sam: 35, jill: 23, wanda: 32}

junior, senior = ages.partition { |k, v| v < 35  }

p junior.to_h
p senior.to_h































































































#
