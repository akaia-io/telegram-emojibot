module Emoji 
  def self.exceptions 
    %w[ ] +                # apple & beats
    [' ', "\n", ] +           # whitespace
    %w[0 1 2 3 4 5 6 7 8 9] + # numbers
    []                        # continue here...
  end
end
