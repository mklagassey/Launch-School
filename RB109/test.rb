# Given an array of n positive integers and a positive integer s, find the
# minimal length of a contiguous subarray of which the sum ≥ s. If there isn't
# one, return 0 instead.

=begin
In: one array of positive integers, one positive integer
Out: => positive integer
Explicit: find the size of the subarray with continuous numbers from given array that will be greater than or equal to given integer when added together, if none, return zero
Implicit:
Examples: shown below
Data Structures: arrays and numbers
Algorithm:
* iterate through given array with starting subarray size of 1
* on each iteration, sum elements of subarray and compare to s
** if sum >= to s, stop iteration and return size of subarray
* if no subarray is found that meets requirement to stop, increment subarray size by 1 and start iterating through given array again
* if none
=end


require 'pry'
=begin
PEDAC
Problem:
=end
def minSubLength(arr, s)
  subarr_size = 0
  index = 0
  loop do
    index = 0
    subarr_size += 1
    loop do
      break if arr[index, subarr_size].sum >= s || index == arr.size
      index += 1
    end
    # binding.pry
    break if subarr_size == arr.size || arr[index, subarr_size].sum >= s
  end
  # binding.pry
  arr[index, subarr_size].sum >= s ? subarr_size : 0
end
# p minSubLength([2,3,1,2,4,3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0
