require_relative "item.rb"

class List

    def initialize(label)
        @label = label
        @items = []
    end

    def label
        @label
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, description = "")
        if Item.valid_date?(deadline) == false
            return false
        else
            @items << Item.new(title, deadline, description)
            return true
        end
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        return false if idx < 0 || idx > @items.length - 1
        true
    end

    def swap(idx1, idx2)
        return false if valid_index?(idx1) == false || valid_index?(idx2) == false
        @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
        true
    end

    def [](idx)
        return nil if valid_index?(idx) == false
        @items[idx]
    end

    def priority
        @items.first
    end

    def print
        @items.each_with_index do |item, idx|
            p  " #{idx}  | #{item.title}   | #{item.deadline}"
        end
    end 

    def print_full_item(idx)
        if valid_index?(idx)
            p " #{@items[idx].title}   |  #{items[idx].deadline}  |  #{@items[idx].description} "
        end
    end

    def print_priority
        p " #{@items[0].title}   |  #{items[0].deadline}  |  #{@items[0].description} "
    end

    def up(idx, amount = 1)
        if valid_index?(idx)
            amount.times do
                self.swap(idx - 1, idx)
            end
        else
            return false
        end
    end

    def down(idx, amount = 1)
        if valid_index?(idx)
            amount.times do
                self.swap(idx, idx + 1)
            end
        else
            return false
        end
    end


end