class PostPolicy < ApplicationPolicy
  def initialize (user, post)
    @user = user
    @post = post
  end

  def create?
    @user.present? && @user.author? || @user.editor?
  end

  def publish?
    @user.present? && @user.editor?
  end

  def publish!
    published = true
    save!
  end

  def update?
    @user.present? && (@user.editor? || @user.author? && @user == @post.author)
  end

  def destroy?
    @user.present? && @user.editor?
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.editor?
        scope.all
      elsif user.present? && user.author?
        scope.where(:author => user)
      else
        scope.where(:published => true)
      end
    end
  end
end
