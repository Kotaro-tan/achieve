class Contact < ActiveRecord::Base
    # 空でないこと
    validates :name, presence: true
    validates :email, presence: true
    validates :content, presence: true
end
