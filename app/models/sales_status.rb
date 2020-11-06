class SalesStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '新品、未使用' },
    { id: 3, name: '未使用に近い' },
    { id: 4, name: '目立ったキズや汚れなし' },
    { id: 5, name: 'ややキズや汚れあり' },
    { id: 6, name: 'キズや汚れあり' },
    { id: 7, name: '欠陥品' }
  ]

  include ActiveHash::Associations
  has_many :items
end
