namespace :carrierwave do
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/uploads/ #{release_path}/public/uploads"
  end
  after "deploy:finalize_update", "carrierwave:symlink"

  task :setup_dir, roles: :app do
  	run "mkdir -p #{shared_path}/uploads"
  end
  after "deploy:setup", "carrierwave:setup_dir"

end