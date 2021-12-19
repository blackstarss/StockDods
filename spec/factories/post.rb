FactoryBot.define do #宣言文でありデータの定義を行う際に記述
  factory :post do
    title { Faker::Lorem.characters(number:10) }
    article { Faker::Lorem.characters(number:30) }
    tags {"#薬学"}
    link {"http://stockdots.net/posts/16"}
    status { false }
  end
end