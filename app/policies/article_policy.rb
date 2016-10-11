class ArticlePolicy < ApplicationPolicy
  attr_reader :user, :article

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