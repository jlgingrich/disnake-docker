TAG = jlgingrich/disnake

latest:
# Before building, make sure requirements are updated
	@.venv/bin/pip freeze > requirements.txt
	@docker build . -t ${TAG}

venv:
# Sets up a local venv with the project requirements
	@python3 -m venv .venv
	@.venv/bin/pip install -r requirements.txt

clean:
# Remove all docker images with the base tag
	@docker images -a | grep "${TAG}*" | awk '{print $$1 ":" $$2}' | xargs docker rmi

run:
# Run docker image
	@docker run ${TAG}