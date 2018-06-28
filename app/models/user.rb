class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :name, :customer_href, :bank_account_href

  has_many :owner_rentals, :class_name => 'Rental', :foreign_key => 'owner_id'
  has_many :buyer_rentals, :class_name => 'Rental', :foreign_key => 'buyer_id'

  has_many :listings

  def vgs_bank_account
    return Vgs::Customer.fetch(self.bank_account_href) if self.bank_account_href
  end

  def vgs_customer
    return Vgs::Customer.fetch(self.customer_href) if self.customer_href

    begin
      customer = self.class.create_vgs_customer(
        :name   => self.name,
        :email  => self.email
        )
    rescue
      'There was error fetching the vgs customer'
    end

    self.customer_href = customer.href
    self.save

    customer
  end

  def self.create_vgs_customer(params = {})
    begin
      VGS::Customer.new(
        :name   => params[:name],
        :email  => params[:email]
      ).save
    rescue
      'There was an error adding a customer'
    end
  end

end
