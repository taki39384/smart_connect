class Mobile < ActiveHash::Base
  self.data = [
    { id: 1, Mobile: '---' },
    { id: 2, Mobile: 'Rakuten' },
    { id: 3, Mobile: 'au' },
    { id: 4, Mobile: 'docomo' },
    { id: 5, Mobile: 'softbank' },
    { id: 6, Mobile: 'UQmobile' },
    { id: 7, Mobile: 'Y!mobile' },
    { id: 8, Mobile: 'ahamo' },
    { id: 9, Mobile: 'povo2.0' },
    { id: 10, Mobile: 'LIMEMO' },
    { id: 11, Mobile: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tasks
end