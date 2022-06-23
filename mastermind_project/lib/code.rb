require "byebug"

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  attr_reader :pegs
  def self.valid_pegs?(arr)
    arr.all? { |ele| POSSIBLE_PEGS.keys.include?(ele.upcase)}
  end

  def initialize(arr)
    if Code.valid_pegs?(arr.join("").upcase.split(""))
      @pegs = arr.join("").upcase.split("")
    else
      raise "No valid pegs."
    end
  end

  def self.random(num)
    arr = []
    num.times { arr << POSSIBLE_PEGS.keys[rand(0...POSSIBLE_PEGS.length)]}
    Code.new(arr)
  end

  def self.from_string(str)    
    Code.new(str.upcase.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(inst)
    num = 0
    @pegs.each.with_index { |ele,i| num += 1 if ele == inst.pegs[i]}
    num
  end

  def num_near_matches(inst)
    new_arr = self.pegs.map.with_index { |ele, i| ele == inst.pegs[i] ? nil : ele }.compact
    other_arr = inst.pegs.map.with_index { |ele, i| ele == self.pegs[i] ? nil : ele }.compact
    num = 0
    (0...new_arr.length).each do |i|
      if new_arr.include?(other_arr[i])
        num += 1
        new_arr[new_arr.index(other_arr[i])] = nil
        other_arr.compact
      end
    end
    num
  end

  def ==(inst)
   self.pegs == inst.pegs  
  end










end
