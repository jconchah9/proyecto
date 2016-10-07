module PermissionsConcern
  extend ActiveSupport::Concern

  def normal_user?
    permission_level >= 1
  end

  def agro?
    permission_level >= 2
  end

  def admin?
    permission_level >= 3
  end
end
