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
featured_count = 0
10.times do
  title = FFaker::HealthcareIpsum.words.map(&:capitalize).join(' ')
  featured = [true, false, false].sample
  if featured && featured_count <= 3
    featured_count += 1
    featured = true
  else
    featured = false
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
