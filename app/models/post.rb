class Post < ActiveRecord::Base
    validates :title, presence:true
    validates :content, length:{minimum: 250}
    validates :summary, length:{maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait?


    
    # def clickbait?
    #     arr = [
    #         /Won't Believe/i,
    #         /Secret/i,
    #         /Top [0-9]*/i,
    #         /Guess/i
    #       ]

    #     if arr.none? {|phrase| phrase.match title}
    #     errors[:title] << "Must be clickbait"
    #     end
    # end
    def clickbait?
        if title && !title.include?("Won't Believe" ||"Secret" || "Top[number]" || "Guess")
            errors[:title] << "Must include a clickbait phrase"
        end
    end

end
