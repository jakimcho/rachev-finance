module FamiliesHelper
  def family_accounts family
    family = Family.find(family)
    family_accounts = []

    family.users.each do |u|
      family_accounts += u.accounts
    end
  end
end
