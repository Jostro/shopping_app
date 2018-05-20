@food = [
    { name: "pizza slice",
      price: 6
    },
    { name: "fries",
      price: 3
    },
    { name: "cheeseburger",
      price: 4
    }
]
@wallet_amt = []
@cart = []


def client_info
    #ask for name
    puts "So, what's your name?"
    name = gets.chomp
    puts "Nice to meet you, #{name}."
    puts "This is a weird question, but how much money do you have?"
    money = gets.chomp.to_i
    #save information about how much money they have
    @wallet_amt << { dollars: money }
    #check what they can buy
    if money == 3
            "I guess you can buy some fries, what do you think? Yes or No?"
            buy_fries = gets.chomp
                if buy_fries == "Yes"
                    puts "There you go, delicious fries for 3 dollars! See you later"
                    exit
                elsif buy_fries == "No"
                    puts "Ok then, see you later"
                    exit
                else
                    puts "I didn't get that, see you another time."
                    exit
                end
        elsif money > 3
            display_inventory(name, money)
        elsif money < 3
            puts "That's not enough to buy anything. Sorry!"
            exit
        else
            puts "Hmm I don't know, I think we have to close our store. See you another time!"
            exit
    end
end

def display_inventory(name, money)
    puts "Great, this is our menu: "
    @food.each_with_index { |food, index| puts "#{index+1}: #{food[:name]}, for $#{food[:price]}"}
    puts "So, #{name} what can we get for you today? As you mentioned, you have #{money} dollars. Pick wisely!"
    choice = gets.chomp.to_i
    select_and_pay(choice, money)
end


def select_and_pay(choice, money)
    if choice > 0 && choice <= @food.length
        if money >= @food[choice-1][:price]
            puts "Great choice, here is #{@food[choice-1][:name]}"
            puts "You have $#{money - @food[choice-1][:price]} left."
            puts "Thanks for shopping and see you later!"
            
            #save the choice to the cart
            @cart << { item: @food[choice-1][:name] }
            #change money in their wallet:
            @wallet_amt << { dollars: money - @food[choice-1][:price] }
        else
            puts "Not enough money, sorry."
        end
    else
        puts "That's not a number of a menu item. Sorry!"
    end
end

def super_client_menu
    puts "Oooo as a Super Important Shopper, you can add new items to our menu."
    #display current menu
    puts "This is our current menu: "
    @food.each_with_index { |food, index| puts "#{index+1}: #{food[:name]}, for $#{food[:price]}"}
    #add new items
    puts "What item would you like to add?"
    super_item_name = gets.chomp
    puts "And how much will it cost?"
    super_item_cost = gets.chomp.to_i
    @food << { name: super_item_name, price: super_item_cost}
    puts "Great, you just added #{super_item_name} for $#{super_item_cost}"
    #ask if they would like to shop or leave
    puts "Would you like to shop now (type yes or no)?"
    answer = gets.chomp
        if answer = "yes"
            client_info
        elsif answer = "no"
            puts "That's ok, thank you and see you later!"
            exit
        else
            puts "I'm not sure what that means. See you later!"
            exit
        end

end

def welcome_to_the_store
    puts "Welcome to the Just Three Items store!"
    puts "Press 1 to start shopping."
    puts "Press 2 to become a Super Important Shopper and change our inventory."
    puts "Press 3 to exit."
    type = gets.chomp.to_i
    introduction(type)
end

def introduction(type)
    case type
        when 1
        client_info
        when 2
        super_client_menu
        when 3
        exit
    end
end

welcome_to_the_store

