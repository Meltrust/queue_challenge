def tickets(ticket_bills)
  available_bills = []
  bill_queue = ticket_bills

  bill_queue.each do |bill|
    return false unless bill == 25 || bill == 100 || available_bills.include?(bill - 25)

    return false if (bill == 100 && !available_bills.combination(2).detect do |a, b|
                       a + b == 75
                     end) ||
                    (bill == 100 && !available_bills.combination(3).detect do |a, b, c|
                       a + b + c == 75
                     end)

    available_bills << bill
    available_bills.delete_at(available_bills.index(25)) if bill == 50
  end

  true
end

p tickets([25, 25, 50]) # => YES
p tickets([25, 100]) # => NO. We will not have enough money to give change to 100 dollars
p tickets([25, 25, 50, 50, 100]) # => NO. We will not have the right bills to give
# 75 dollars of change (you can't make two bills of 25 from one of 50)
p tickets([25, 25, 50, 25, 25, 25, 100, 50, 50]) # => YES
p tickets([25, 25, 100, 50]) # => NO
