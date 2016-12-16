FactoryGirl.define do
  factory :event do
    token ""
    user nil
    begins "2016-12-16 13:02:47"
    ends "2016-12-16 13:02:47"
    repeats false
    repeat_rule "MyText"
    title "MyString"
    description "MyText"
  end
end
