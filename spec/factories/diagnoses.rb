FactoryBot.define do
  factory :diagnosis_exists, class: "diagnosis" do
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

  factory :diagnosis_all1, class: "diagnosis" do
    association :user

    communication     { '1' }
    planning          { '1' }
    dexterous         { '1' }
    tidy              { '1' }
    physically        { '3' }
    muscle            { '1' }
    intelligence      { '1' }
    careful           { '1' }
    pride             { '1' }
    picky             { '1' }
    destruction       { '1' }
    narrow            { '1' }
    dirt              { '1' }
    high              { '1' }
  end

  factory :diagnosis_craftsman72, class: "diagnosis" do
    association :user

    communication     { '4' }
    planning          { '4' }
    dexterous         { '4' }
    tidy              { '4' }
    physically        { '4' }
    muscle            { '4' }
    intelligence      { '4' }
    careful           { '4' }
    pride             { '4' }
    picky             { '4' }
    destruction       { '1' }
    narrow            { '1' }
    dirt              { '1' }
    high              { '1' }
  end

  factory :diagnosis_success, class: "diagnosis" do
    association :user

    communication     { '5' }
    planning          { '5' }
    dexterous         { '5' }
    tidy              { '5' }
    physically        { '5' }
    muscle            { '5' }
    intelligence      { '5' }
    careful           { '1' }
    pride             { '5' }
    picky             { '5' }
    destruction       { '1' }
    narrow            { '1' }
    dirt              { '1' }
    high              { '1' }
  end
end
