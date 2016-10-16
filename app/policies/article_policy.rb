class ArticlePolicy < ApplicationPolicy
  attr_reader :user, :article

  def initialize(current_user, article)
    if current_user
      @user = current_user
    elsif article.class == Article
      @user = article.user
    end
    @article = article
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.admin? || user.author? if user
  end

  def update?
    user.admin? || user.author? if user
  end

  def destroy?
    user.admin? || user.author? if user
  end

end