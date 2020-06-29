# For this practice problem, write a one-line program that creates the
# following output 10 times, with the subsequent line indented 1 space to
# the right:

# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!

 # 10.times { |x| puts "The Flintstones Rock!".rjust(x + 21)}

# puts "the value of 40 + 2 is #{(40 + 2)}"
# puts "the value of 40 + 2 is " + (40 + 2).to_s

# Alan wrote the following method, which was intended to show all of the factors
# of the input number:

# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end

# Alyssa noticed that this will fail if the input is 0, or a negative number,
# and asked Alan to change the loop. How can you make this work without using
# begin/end/until? Note that we're not looking to find the factors for 0 or
# negative numbers, but we just want to handle it gracefully instead of raising
# an exception or going into an infinite loop.

# def factors(number)
#   divisor = number
#   factors = []
#   loop do
#     break if divisor < 1
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end
#   factors
# end
#
# p factors(10)

# limit = 15
#
# def fib(first_num, second_num, limit)
#   while first_num + second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end
#
# result = fib(0, 1, limit)
# puts "result is #{result}"

# answer = 42
#
# def mess_with_it(some_number)
#   some_number += 8
# end
#
# new_answer = mess_with_it(answer)
#
# p answer - 8

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }
#
# def mess_with_demographics(demo_hash)
#   demo_hash.values.each do |value|
#     value["age"] += 42
#     value["gender"] = "other"
#   end
# end
#
# mess_with_demographics(munsters)
#
# p munsters










































#
