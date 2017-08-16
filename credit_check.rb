class CreditCheck

  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def create_array_convert
    card_number.to_s.reverse!.split("").map(&:to_i)
  end

  def multiply_other_num
    create_array_convert.map.with_index do |num, index|
      if index.odd?
        num * 2
      else
        num
      end
    end
  end

  def add_double_digits
    multiply_other_num.map do |num|
      if num > 9
        num.to_s.chars.map(&:to_i).reduce(:+)
      else
        num
      end
    end
  end

  def add_elements
    add_double_digits.reduce(0, :+)
  end

  def end_of_game
    if add_elements % 10 == 0
       true
       p "Your Credit Card is verified"
    else
      false
       p "Your Credit Card is not verified"
    end
  end

end

creditcheck = CreditCheck.new(342804633855673)
creditcheck.end_of_game
