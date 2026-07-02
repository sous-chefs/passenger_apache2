# frozen_string_literal: true

name 'passenger_apache2'

run_list 'passenger_apache2::default'

named_run_list :source, 'passenger_apache2::default'
named_run_list :package, 'passenger_apache2_test::package', 'passenger_apache2::default'
named_run_list :version_override, 'passenger_apache2::default'

cookbook 'passenger_apache2', path: '.'
cookbook 'apache2', git: 'https://github.com/sous-chefs/apache2.git', branch: 'main'
cookbook 'apt', git: 'https://github.com/sous-chefs/apt.git', branch: 'main'
cookbook 'passenger_apache2_test', path: './test/cookbooks/passenger_apache2_test'
cookbook 'yum-epel', git: 'https://github.com/sous-chefs/yum-epel.git', branch: 'main'

Dir.children('./test/cookbooks/passenger_apache2_test/recipes').grep(/\.rb\z/).sort.each do |recipe|
  recipe_name = File.basename(recipe, '.rb')

  named_run_list :"test_#{recipe_name}", "passenger_apache2_test::#{recipe_name}"
end
