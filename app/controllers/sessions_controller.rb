class SessionsController < Devise::SessionsController
  def new_guest #ゲストユーザのログイン
    user = User.find_or_create_by(username: 'Guest', email: 'guest@example.com') do |user| #ゲストユーザーがあれば取り出し、なければ作成する
      user.password = SecureRandom.urlsafe_base64 #ランダムパスワードの作成
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
   end
end