# Write a method named print_me that prints I'm printing within the method! when invoked as follows:

# def print_me
#   puts "I'm printing within the method!"
# end
#
# print_me

# Write a method named print_me so that I'm printing the return value! is printed when running the following code:

# def print_me
#   "I'm printing within the method!"
# end
#
# puts print_me

# Write two methods, one that returns the string "Hello" and one that returns the string "World". Then print both strings using #puts, combining them into one sentence.

# def hello
#     "Hello"
# end
#
# def world
#     "World"
# end
#
# puts "#{hello} #{world}"

# Write a method named greet that invokes the following methods:

# def hello
#   'Hello'
# end
#
# def world
#   'World'
# end
#
# def greet
#   puts "#{hello} #{world}"
# end
#
# greet

# Using the following code, write a method called car that takes two arguments and prints a string containing the values of both arguments.

# def car(make, model)
#   make + ' ' + model
# end
#
# puts car('Toyota', 'Corolla')

# The variable below will be randomly assigned as true or false. Write a method named time_of_day that, given a boolean as an argument, prints "It's daytime!" if the boolean is true and "It's nighttime!" if it's false. Pass daylight into the method as the argument to determine whether it's day or night.

# daylight = [true, false].sample
#
# def time_of_day(day)
#   day ? p("It's daytime!") : p("It's nighttime!")
# end
#
# time_of_day(daylight)

# def dog(name)
#   return name
# end
#
# def cat
#   return 'Greta'
# end
#
# puts "The dog's name is #{dog('Spot')}."
# puts "The cat's name is #{cat}."

# Write a method that accepts one argument, but doesn't require it. The parameter should default to the string "Bob" if no argument is given. The method's return value should be the value of the argument.

# def assign_name(name = 'Bob')
#   name
# end
#
# puts assign_name('Kevin') == 'Kevin'
# puts assign_name == 'Bob'

# Write the following methods so that each output is true.

# def add(num_1, num_2)
#   num_1 + num_2
# end
#
# def multiply(arg_1, arg_2)
#   arg_1 * arg_2
# end
#
# puts add(2, 2) == 4
# puts add(5, 4) == 9
# puts multiply(add(2, 2), add(5, 4)) == 36

# The variables below are both assigned to arrays. The first one, names, contains a list of names. The second one, activities, contains a list of activities. Write the methods name and activity so that they each take the appropriate array and return a random value from it. Then write the method sentence that combines both values into a sentence and returns it from the method.

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(names)
  names.sample
end

def activity(activities)
  activities.sample
end

def sentence(name, activity)
  "#{name} went #{activity} today!"
end

puts sentence(name(names), activity(activities))























#
