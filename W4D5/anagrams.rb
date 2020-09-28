def first_anagram?(str1, str2)
    str1.split("").permutation.map(&:join).include?(str2)
end #O(n!)


puts first_anagram?('anb', 'nba')

def second_anagram?(str1, str2)
    str1.each_char do |char|
        idx = str2.index(char)
        str2[idx] = ""
    end
    str2.length == 0
end #O(n)

puts second_anagram?('anb', 'nbaa')


def third_anagram?(str1, str2)
    sorted1 = str1.split("").sort #O(n)
    sorted2 = str2.split("").sort #O(m)

    sorted1 == sorted2 
end #O(n + m)

puts third_anagram?('anba', 'nbaa')

def fourth_anagram?(str1, str2)
    hash = Hash.new(0)
    hash1 = Hash.new(0)
    str1.each_char {|ele| hash[ele] += 1}
    str2.each_char {|ele| hash1[ele] += 1}
    hash == hash1
end #O(n+m)


def bonusA_anagram?(str1, str2)
    hash = Hash.new {|h,k| h[k] = []}

    hash[str1] = str1.split("").sort
    hash[str2] = str2.split("").sort

    hash.values.all? {|ele| ele == str1.split("").sort}
end

def bonusB_anagram?(str1, str2)
    hash = Hash.new(0)
    str1.each_char {|char| hash[char] += 1}
    str2.each_char {|char| hash[char] -= 1}
    hash.values.all? {|ele| ele == 0}
end

puts fourth_anagram?('anba', 'nbaa')

puts bonus_anagram?('anba', 'nbaa') 