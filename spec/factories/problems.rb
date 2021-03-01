FactoryBot.define do
  factory :problem do
    title { 'problem' }
    content { 'problem' }
  end

  factory :second_problem, class: Problem do
    title { 'problem2' }
    content { 'problem2' }
  end
end
