class FriendMailer < ApplicationMailer
  default from: "from@socialrecipe.com.br"
  def recipe_mail(email, user, recipe, message)
    @user = user
    @recipe = recipe
    @message = message
    mail(to: email, subject: "#{@user.name} sent a delicious recipe!")
  end
end
