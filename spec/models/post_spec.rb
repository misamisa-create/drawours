# frozen_string_literal: true

require 'rails_helper'

describe 'モデルのテスト' do
  describe 'バリデーションのテスト' do
    
    subject { post.valid? }

    let(:user) { create(:user) }
    let!(:post) { build(:post, user_id: user.id) }

    context 'titleカラム' do
      it '50文字以下であること: 50文字は〇' do
        post.title = Faker::Lorem.characters(number: 50)
        is_expected.to eq true
      end
      it '50文字以下であること: 51文字は×' do
        post.title = Faker::Lorem.characters(number: 51)
        is_expected.to eq false
      end
    end

    context 'textカラム' do
      it '200文字以下であること: 200文字は〇' do
        post.text = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '200文字以下であること: 201文字は×' do
        post.text = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end

    context 'instrumentカラム' do
      it '50文字以下であること: 50文字は〇' do
        post.instrument = Faker::Lorem.characters(number: 50)
        is_expected.to eq true
      end
      it '50文字以下であること: 201文字は×' do
        post.instrument = Faker::Lorem.characters(number: 51)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:comments).macro).to eq :has_many
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end
end