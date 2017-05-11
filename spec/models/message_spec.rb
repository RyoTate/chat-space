require 'rails_helper'

describe Message do
  describe '#create' do

    it "is valid with a body, image, user_id, group_id" do #メッセージが保存できる場合
      message = build(:message)
      expect(message).to be_valid #登録ができることを確かめるbe_validマッチャ→正常に保存されることを期待するエクスペクテーションが必要
    end

    it "is invalid without a body" do #メッセージが保存できない場合
      message = build(:message, body: "")
      message.valid?
      #ActiveRecord::Baseを継承しているクラスのインスタンスを保存する際に「バリデーションにより保存ができない状態であるか」を確かめる
      expect(message.errors[:body]).to include("を入力してください")
      #valid?メソッドを利用したインスタンス対してerrorsメソッドを利用すると、バリデーションにより保存ができない状態である場合なぜできないのかを確認することができます。
    end
  end
end
