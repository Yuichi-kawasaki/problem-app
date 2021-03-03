FactoryBot.define do
  factory :label do
    title {'新規'}
  end
  factory :label2, class: Label do
    title {'リピート'}
  end

  factory :label3, class: Label do
    title {'近隣トラブル'}
  end
end
