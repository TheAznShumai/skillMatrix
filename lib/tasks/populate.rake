# lib/tasks/populate.rake
# #
# # Rake task to populate development database with test data
# # Run it with "rake db:populate"

namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'

    Rake::Task['db:reset'].invoke

    # Create admin_user account

    admin_user = User.create!(:email => 'admin@admin.com',
                              :username => 'admin',
                              :admin => true,
                              :password => 'asdzxc123',
                              :password_confirmation => 'asdzxc123',
                              :profile_attributes => {
                                :first_name => 'John',
                                :last_name => 'Doe',
                                :office_phone => Faker::PhoneNumber.phone_number,
                                :cell_phone => Faker::PhoneNumber.cell_phone,
                                :title => 'Administrator',
                                :department => 'Super Hero'})

    # Create Surveys with some questions and skills

    15.times do
      survey = Survey.create!(:name => Faker::Commerce.product_name,
                              :tag_list => Faker::Lorem.word)
      # TODO - need survey icons

      3.times do
        question = Question.create!(:text => Faker::Lorem.sentence,
                                    :survey_id => survey.id)
      end

      3.times do
        skill = Skill.create!(:name => Faker::Company.bs)
        survey_skill = SurveySkill.create!(:survey_id => survey.id,
                                           :skill_id => skill.id)

      end
    end

    # Create normal users with profile
    # Also have user take the surveys

    20.times do
      user = User.create!(:email => Faker::Internet.email,
                               :username => Faker::Internet.user_name,
                               :manager_id => User.offset(rand(User.count)).first.id,
                               :password => 'asdzxc123',
                               :password_confirmation => 'asdzxc123',
                               :profile_attributes => {
                                  :first_name => Faker::Name.first_name,
                                  :last_name => Faker::Name.last_name,
                                  :office_phone => Faker::PhoneNumber.phone_number,
                                  :cell_phone => Faker::PhoneNumber.cell_phone,
                                  :title => Faker::Name.title,
                                  :department => Faker::Commerce.department})

      # Create attempts, answers on random surveys
      # get half or less of the survey ids randomly
      survey_ids = Survey.offset(rand(Survey.count)).limit(Survey.count/2).ids

      # for each random survey create an attempt on with answers to questions
      survey_ids.each do |survey_id|
        attempt = Attempt.create!(:survey_id => survey_id, :user_id => user.id)
        question_ids = Question.where(:survey_id => survey_id).ids
        question_ids.each do |question_id|
          Answer.create!(:attempt_id => attempt.id,
                         :question_id => question_id,
                         :text => Faker::Lorem.sentence)
        end
        # Create a user_skill relationship and a rating (skills are independent from survey)
        # get 2 or less skills randomly
        # NOTE - RANDOM() is a postgres function Use RAND() for mysql
        skill_ids = SurveySkill.where(:survey_id => survey_id).limit(2).order("RANDOM()").pluck(:skill_id)

        skill_ids.each do |skill_id|
          if UserSkill.where(:user_id => user.id, :skill_id => skill_id).first.nil?
            user_skill = UserSkill.create!(:user_id => user.id, :skill_id => skill_id)
            Rating.create!(:user_skill_id => user_skill.id, :score => rand(1..5))
          end
        end
      end
    end

    # Create some project with random managers
    20.times do
      user_id = User.where(true).limit(1).order("RANDOM()").pluck(:id).first
      project = Project.create!(:name => Faker::Commerce.product_name,
                                :description => Faker::Lorem.paragraphs.join,
                                :project_manager_id => user_id,
                                :department => Faker::Commerce.department,
                                :status_id => rand(5))
    end

  end
end
