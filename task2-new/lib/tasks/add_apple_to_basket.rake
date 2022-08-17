# -*- encoding : utf-8 -*-

namespace :add_apple_to_basket do
  desc 'Add apple to basket'
  task :add_apple_to_basket, [:variety, :count] => [:environment] do |t, args|

    variety = args[:variety].downcase
    @count = args[:count].to_i

    Basket.all.each do |basket|
      basket_variety = basket.apples.pluck(:variety).uniq

      if (@count > 0) && (basket.fill_rate.to_i == 0 or basket_variety.include?(variety))
        rem_capacity = basket.capacity*(100-basket.fill_rate.to_i)/100

        if @count <= rem_capacity
          @count.times do
            Apple.new(variety: variety, basket_id: basket.id).save
          end
          fill_rate = (@count * 100)/ basket.capacity
          fill_rate += basket.fill_rate.to_i
          basket.update(fill_rate: fill_rate)
          @count = 0
        else
          rem_capacity.times do
            Apple.new(variety: variety, basket_id: basket.id).save
          end
          basket.update(fill_rate: 100)
          @count = @count - rem_capacity
        end
      end
    end

    if @count > 0
      puts "All baskets are full. We couldn't find the place for #{@count} apples"
    else
      puts "Added #{args[:count].to_i} apples in to baskets"
    end
  end
end
