# In this hash of people and their age,see if "Spot" is present.

# Bonus: What are two other hash methods that would work just as well for
# this solution?

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
#
# p ages.assoc("Lily") != nil
# p ages.any? { |k,v| k == "Lily"}
# p ages.fetch("Lily", false) != false
# p ages.has_key?("Lily")
# p ages.include?("Lily")
# p ages.key?("Lily")
# p ages.member?("Lily")
#
# p ages.assoc("Spot") != nil
# p ages.any? { |k,v| k == "Spot"}
# p ages.fetch("Spot", false)
# p ages.has_key?("Spot")
# p ages.include?("Spot")
# p ages.key?("Spot")
# p ages.member?("Spot")

# Starting with this string:
# munsters_description = "The Munsters are creepy in a good way."
# # Convert the string in the following ways (code will be executed on
# # original munsters_description above):
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY." # call #swapcase
# "The munsters are creepy in a good way." # call #capitalize
# "the munsters are creepy in a good way." # call #downcase
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY." # call #upcase
#
# p munsters_description.swapcase == "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# p munsters_description.capitalize == "The munsters are creepy in a good way."
# p munsters_description.downcase == "the munsters are creepy in a good way."
# p munsters_description.upcase == "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

# We have most of the Munster family in our age hash:

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
#
# # add ages for Marilyn and Spot to the existing hash
#
# additional_ages = { "Marilyn" => 22, "Spot" => 237 }
#
# ages.merge!(additional_ages)
#
# p ages

# See if the name "Dino" appears in the string below:

# advice = "Few things in life are as important as house training your pet dinosaur."
#
# p advice.include?("Dino")
# p advice.include?("dinosaur")
# p advice.match?("Dino")
# p advice.match?("dinosaur")

# Show an easier way to write this array:

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
# flintstones = %w[Fred Barney Wilma Betty BamBam Pebbles]
# # flintstones << "Dino" << "Hoppy"
# flintstones.insert(-1, 'Dino', 'Hoppy')
# p flintstones

# Shorten this sentence:

# advice = "Few things in life are as important as house training your pet dinosaur."
#
# # ...remove everything starting from "house".
#
# # Review the String#slice! documentation, and use that method to make the
# # return value "Few things in life are as important as ". But leave the
# # advice variable as "house training your pet dinosaur.".
#
# p advice.slice!(/F.*house/)
# p advice
#
# advice = "Few things in life are as important as house training your pet dinosaur."
# # As a bonus, what happens if you use the String#slice method instead?
# p advice.slice(/F.*house/)
# p advice

# Write a one-liner to count the number of lower-case 't' characters in
# the following string:

# statement = "The Flintstones Rock!"
#
# p statement.count "t"

# Back in the stone age (before CSS) we used spaces to align things on
# the screen. If we had a 40 character wide table of Flintstone family
# members, how could we easily center that title above the table with spaces?

title = "Flintstone Family Members"

puts title.center(40)

















































































#
