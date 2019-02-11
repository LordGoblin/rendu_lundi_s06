class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def welcome_email(user)

    @user = user 

    @url  = 'http://monsite.fr/login' 

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def inscription_event_email(attendance)
  	@attendance = attendance


  	@url = 'http://monsite.fr/login'

  	#mail(to: @attendance.user.email, subject: 'les inscrit pour event !')

  	mail(to: @attendance.event.user.email, subject: 'inscription pour event !')

  end
end
