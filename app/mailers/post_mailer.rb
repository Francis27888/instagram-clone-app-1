class PostMailer < ApplicationMailer
  def post_mail(user,post_content)
    @post=post_content
    @user=user
    mail(to: @user.email,message:"You created a new post!!!")
  end
end
