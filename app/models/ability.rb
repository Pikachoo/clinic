class Ability
  include CanCan::Ability

  # TODO: add limit access to controller
  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new
    patient ||= Patient.find_by(user_id: user.id)
    employee ||= Employee.find_by(user_id: user.id)

    if user.is? 'doctor'
      can :manage, CardRecord
      can :read, DoctorReception, employee_id: employee.id
    end

    if user.is? 'patient'
      can :manage, Patient, user_id: user.id
      can :read, Card, patient_id: patient.id
    end

    if user.is? 'admin'
      can :manage, Card
      can :manage, User
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
