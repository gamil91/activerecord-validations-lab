class Post < ActiveRecord::Base
    validates :title, presence:true
    validates :content, length:{minimum: 250}
    validates :summary, length:{maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait?


    
    def clickbait?
        arr = [
            /Won't Believe/i,
            /Secret/i,
            /Top [0-9]*/i,
            /Guess/i
          ]

        if arr.none? {|phrase| phrase.match title}
        errors[:title] << "Must be clickbait"
        end
    end

end
