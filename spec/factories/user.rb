FactoryBot.define do
  factory :user do
    name { 'Anderson' }
    photo { 'https://media.licdn.com/dms/image/D4E03AQHUp8AJl-0q3g/profile-displayphoto-shrink_400_400/0/1677634492816?e=1689811200&v=beta&t=brB8LkXqB3EGmGLhFiwdJif_3NRMqJj6erfyRYrrUO0' }
    bio do
      'Self-taught web developer with over 2 years of experience working on complex software development.
      I am eager to work on new projects in the near future.'
    end
    post_counter { 0 }
  end

  factory :user2 do
    name { 'Sophie' }
    photo { 'https://media.licdn.com/dms/image/D4E03AQHUp8AJl-0q3g/profile-displayphoto-shrink_400_400/0/1677634492816?e=1689811200&v=beta&t=brB8LkXqB3EGmGLhFiwdJif_3NRMqJj6erfyRYrrUO0' }
    bio do
      'Self-taught web developer with over 2 years of experience working on complex software development.
      I am eager to work on new projects in the near future.'
    end
    post_counter { 0 }
  end
end
