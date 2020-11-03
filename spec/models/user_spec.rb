require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
     
    it "重複したemailが存在する場合登録できないこと" do 
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
     
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.password_confirmation = "" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank") 
    end
    
    it "passwordが６文字以下だと登録できない" do
      @user.password = "000aaa"
      @user.password_confirmation = "000aaa"
      @user.valid?
    end

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")  
  end

    it "password:半角英数混合(半角英語のみ)でないと登録できない" do
      @user.password = "aaaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください" )
    end
     
    it "last_nameが空だと登録できない" do
       @user.last_name = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "last_nameが半角文字だと登録できない" do
      @user.last_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end

    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "first_nameが半角文字だと登録できない" do
       @user.first_name = "ｱｲｳｴｵ"
       @user.valid?
       expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
  
    it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
     
    it "last_name_kanaが全角カタカナでないと登録できない" do
      @user.last_name_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana はカタカナで入力して下さい")
    end

    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "first_name_kanaが全角カタカナでないと登録できない" do
      @user.first_name_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana はカタカナで入力して下さい")
    end

    it "birth_dateが空だと登録できない" do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
 end
