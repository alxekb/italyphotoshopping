# frozen_string_literal: true

class BrandPolicy < ApplicationPolicy
  def show?
    @user.admin?
  end

  class Scope < Scope
    def resolve
      if @user.admin?
        scope.all
      else
        false
      end
    end
  end
end
