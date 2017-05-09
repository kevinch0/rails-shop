class AccountsController < Devise::RegistrationsController

  def create
    @account = Account.new()
    @account.save
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Success"
      @user.account = @account
      @user.account_id = @account.id
      @user.save
      redirect_to 'root'
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
