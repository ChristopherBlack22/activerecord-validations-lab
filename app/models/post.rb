class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :title_is_not_clickbait

    def title_is_not_clickbait
        clickbait = [/Won't Believe/, /Secret/, /Top \d/, /Guess/]
        if clickbait.none? do |bait|
            bait.match(title)
            end 
                errors.add(:title_is_not_clickbait, "Title isnt sufficently clickbait-y")
        end
    end 
end
