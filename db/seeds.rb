Articlestatus.create(
  title: 'Draft'
)
Articlestatus.create(
  title: 'Published'
)
Articlestatus.create(
  title: 'Archived'
)
User.create(
  name: 'David Harris',
  email: 'forbiddenvoid@gmail.com',
  password: 'Password'
)
User.create(
  name: 'Ryan Collins',
  email: 'admin@ryancollins.io',
  password: 'Password'
)
User.create(
  name: 'Andreas Daimainger',
  email: 'andreas@gmail.com',
  password: 'Password'
)

featured_count = 0
10.times do
  title = FFaker::HealthcareIpsum.words.map(&:capitalize).join(' ')
  slug = title.split(' ').map(&:downcase).join('-')
  featured = [true, false, false].sample
  if featured && featured_count <= 3
    featured_count += 1
    featured = true
  else
    featured = false
  end
  Article.create(
    user: User.all.sample,
    status: Articlestatus.all.sample,
    title: title,
    slug: slug,
    featured: featured,
    spotlighted: featured,
    content: FFaker::HealthcareIpsum.paragraphs,
    feature_image: FFaker::Avatar.image
  )
end
