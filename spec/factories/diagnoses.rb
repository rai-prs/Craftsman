FactoryBot.define do
  factory :diagnosis do
    association :user

    communication     { '3' }
    planning          { '3' }
    dexterous         { '3' }
    tidy              { '3' }
    physically        { '3' }
    muscle            { '3' }
    intelligence      { '3' }
    careful           { '3' }
    pride             { '3' }
    picky             { '3' }
    destruction       { '3' }
    narrow            { '3' }
    dirt              { '3' }
    high              { '3' }
  end
end
