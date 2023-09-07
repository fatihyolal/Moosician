class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin? ? scope.all : Message.joins(chatroom: scope).where(user: user)
    end
  end

  def update?
    record.user == user
  end

  def destroy
    record.user == user
  end

  def show?
    true
  end

  # def index?
  #   true
  # end
end
