# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

array = %W(イラスト 絵画 デザイン 写真 彫刻 パフォーマンス 建築 工芸 立体)
array.each{|tag|
  tag_list = ActsAsTaggableOn::Tag.new
  tag_list.name = tag
  tag_list.save
}


User.create!(name: 'test',display_name: 'test', email: 'test@test', password: 'testuser', confirmed_at: Time.now)