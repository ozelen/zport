class RegistrationsController < Devise::RegistrationsController

  private
    def sign_up_params
      params.require(:person).permit(:nickname, :slug, :email, :first_name, :last_name, :summary,
                                     :password, :password_confirmation, address_attributes: Address.attr_permitted)
    end

    def account_update_params
      params.require(:person).permit(:nickname, :slug, :email, :first_name, :last_name, :summary,
                                     :password, :password_confirmation, :current_password)
    end
end
