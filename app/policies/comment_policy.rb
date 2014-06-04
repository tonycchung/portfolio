class CommentPolicy < ApplicationPolicy
  def initialize (user, comment)
    @user = user
    @comment = comment
  end

  def approve?
    @user.present? && @user.editor?
  end

  def approve!
    approved = true
    save!
  end

  def update?
    @user.present? && (@user.editor? || @user.author? && @user == @comment.author)
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
        scope.where(:approved => true)
      end
    end
  end
end
