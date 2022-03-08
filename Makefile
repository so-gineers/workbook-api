# Build base images for development
#
# run make build_base_images
build_base_images:
	docker compose build api_ruby_alpine_tests api_ruby_alpine api_ruby
# Build base images for development on ruby 3
#
# run make build_base_images_for_ruby3
build_base_images_for_ruby3:
	docker compose build base_api_ruby3
# Start the test containers running guard
#
# run make start_guard
start_guard:
	docker compose up api_ruby_alpine_tests
start_swagger_editor_students:
	docker compose up swagger_editor_students
start_swagger_editor_teachers:
	docker compose up swagger_editor_teachers
start_swagger_ui_teachers:
	docker compose up swagger_ui_teachers
refresh_bundles:
	BUNDLE_GEMFILE=NextGemfile bundle install
	bundle install

rubocop:
	./bin/rubocop
