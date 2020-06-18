class Brand < ActiveHash::Base
  self.data = [
    {id: 1, name: 'ノーブランド'}, {id: 2, name: 'プーマ'}, {id: 3, name: 'ナイキ'},
    {id: 4, name: 'アディダス'}, {id: 5, name: 'コンバース'}, {id: 6, name: 'ニューバランス'},
    {id: 7, name: 'HITACHI'}, {id: 8, name: '三菱'}, {id: 9, name: 'SONY'},
    {id: 10, name: '富士通'}, {id: 11, name: 'NEC'}, {id: 12, name: 'Panasonic'}
  ]
end
