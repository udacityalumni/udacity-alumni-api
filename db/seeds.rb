User.create(
  name: 'David Harris',
  email: 'forbiddenvoid@gmail.com',
  password: 'Password'
)
User.create(
  name: 'Ryan Collins',
  email: 'admin@ryancollins.io',
  password: 'Password',
  bio: 'Experienced Software Engineer specializing in implementing cutting-edge technologies in a multitude of domains, focusing on Front End Web Development and UI / UX.',
  avatar: 'https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAQyAAAAJDU3YWY4Nzk1LWQ0YzEtNGIyMy1iOWI3LTBmMTllMmI1Y2Q5NQ.jpg'
)
User.create(
  name: 'Andreas Daimainger',
  email: 'andreas@gmail.com',
  password: 'Password',
  bio: 'I started to code about 2 years ago and have been very focused on developing cutting edge UI components. I have a passion for functional programming, and I love creating environments that make it easier for developers to write consistent, testable code.',
  avatar: 'https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAcWAAAAJDM2ZjBiYmMwLTk4ZmUtNGVkOC05MjYyLTMxMGI1ZmU1NTMyZQ.jpg'
)

User.create(
  name: 'Demo User',
  email: 'demo@udacity.com',
  password: 'Password123!',
  bio: 'An amazing, but sadly fake user',
  avatar: 'http://data.whicdn.com/images/88776105/superthumb.jpg'
)

# Articles
# ===================================
# {
#   articles: [
#     {
#       id: 1,
#       title: 'Foo Bar, Reimagined',
#       slug: 'foo-bar-reimagined',
#       user: {
#         avatar: 'http://1onjea25cyhx3uvxgs4vu325.wpengine.netdna-cdn.com/wp-content/uploads/2016/05/image08.png',
#         name: 'David Harris'
#       },
#       content: '## Foo bar, reimagined.  Oh yeah!  _So_ cool.  The presidential candidates announced just last night that foo bar will... ![Foo Bar](http://www.techspot.com/images2/downloads/topdownload/2014/07/foobar.png)',
#       excerpt: 'Oh yeah!  _So_ cool.  The presidential candidates',
#       status: 'Published',
#       featureImage: 'http://foobar.iiitd.edu.in/contest/images/FooBarLogo_cropped.png',
#       spotlighted: true,
#       featured: true
#     },
#    {
#      ...
#    }
#   ]
# }
#
statuses = *(0..2)
spotlighted_count = 0
10.times do
  title = FFaker::HealthcareIpsum.words.map(&:capitalize).join(' ')
  featured = [true, false, false].sample
  spotlighted = [true, false].sample
  if spotlighted && spotlighted_count <= 3
    spotlighted_count += 1
    spotlighted = true
  else
    spotlighted = false
  end
  Article.create(
    user: User.all.sample,
    title: title,
    featured: featured,
    spotlighted: featured,
    status: statuses.sample,
    content: FFaker::HealthcareIpsum.paragraph,
    feature_image: FFaker::Avatar.image
  )
end
