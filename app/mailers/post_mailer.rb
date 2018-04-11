class PostMailer < ApplicationMailer
  def post_mailer(user)
    @user=user
    mail(to: @user.email,message:"You created a new post!!!")
  end
end
