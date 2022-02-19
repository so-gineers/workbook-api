# Build base images for development
#
# run make build_base_images
build_base_images:
	docker compose build base_api
# Build base images for development on ruby 3
#
# run make build_base_images_for_ruby3
build_base_images_for_ruby3:
	docker compose build base_api_ruby3
# Start the test containers running guard 
#
# run make start_guard 
start_guard:
	docker compose -f ./docker-compose-rails.yml up api_ruby_tests api_ruby_next_tests
make start_swagger:
	docker compose -f ./docker/compose/swagger.yml up 
  echo 'You can visit http://localhost_3527 to edit' 

