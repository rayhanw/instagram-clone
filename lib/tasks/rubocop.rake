namespace :lint do
  task :do_it do
    puts "------ Starting ------"
    system "rubocop app/"
    puts "------ Ending ------"
  end

  task default: :do_it
end

desc "Lints app/ folder with Rubocop"
task lint: 'lint:do_it'
