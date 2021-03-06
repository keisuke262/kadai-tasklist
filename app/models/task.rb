class Task < ApplicationRecord
    #コンテントにvalidation(検証)をかけている
    #検証の内容は、コンテントの中身が空っぽでないか、また文字数が255文字以内であるかである。
    validates :content, presence: true, length: { maximum: 255 }
    validates :deadline, presence: true, length: { maximum: 30 }
    validates :status, presence: true, length: { maximum: 30 }
end
