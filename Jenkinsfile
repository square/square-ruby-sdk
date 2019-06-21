node {
     stage 'Checkout'
        checkout scm

    stage 'Prepare'
        bat 'bundle install'

    stage 'Test'
        bat 'bundle exec rake'
}