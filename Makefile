build_base_images:
	docker compose build base_api

start_guard:
	docker compose up api_ruby_tests api_ruby_next_tests