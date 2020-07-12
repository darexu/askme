module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def inclination(amount, yenot, yenota, yenotov)
    return yenotov if (11..14).include?(amount % 100)

    number = amount % 10

    if number == 1
      yenot
    elsif number.between?(2,4)
      yenota
    else
      yenotov
    end
  end

  def no_answer(questions)
    questions.select { |q| q.answer.nil? }.size
  end
end
