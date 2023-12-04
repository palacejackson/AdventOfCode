class Puzzle

  NUMBERS = {one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9}.freeze

  def part1(input)
    all_numbers = []
    input.map do |line|
        numbers_array = line.scan(/\d/)
        number_as_string = numbers_array[0] + numbers_array[-1]
        number = number_as_string.to_i
        all_numbers.push(number)
      end
    total = all_numbers.sum
    print total
  end

  def part2(input)

    num_pattern = NUMBERS.keys.join("|")

    input.map { |line|
      matches_first = line.scan(/(?=(#{num_pattern}|\d))/).first
      matches_last = line.scan(/(?=(#{num_pattern}|\d))/).last
      first = NUMBERS[matches_first[0].to_sym] || matches_first[0]
      last = NUMBERS[matches_last[-1].to_sym] || matches_last[-1]

      integer = Integer("#{first}#{last}")
  }.inject(:+)

  end
end
