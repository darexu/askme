module QuestionsHelper
  def link_to_question_author(question)
    return link_to(question.author&.username, user_path(question.author), class: "author-link") if question.author.present?
    "Аноним"
  end

  def text_with_hashtag_link(text)
    text.gsub(Hashtag::REGEXP) do |ht|
      link_to ht, hashtag_path(ht.delete('#').downcase)
    end.html_safe
  end
end
