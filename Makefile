# tag all commands with .PHONY (directive that they are not files)
.PHONY: check
check:
	python manage.py check
.PHONY: rs
rs:
	python manage.py runserver

.PHONY: migrations
migrations:
	python manage.py makemigrations

.PHONY:migrate
migrate:
	python manage.py migrate

.PHONY:update
update: migrations migrate;

.PHONY:su
su:
	python manage.py createsuperuser

.PHONY:lint
lint:
	pre-commit run -a

.PHONY:shell
shell:
	python manage.py shell_plus

.PHONY:url
url:
	python manage.py show_urls

# testing
.PHONY:cov
cov:
	pytest --cov=journal --migrations -n 2 --dist loadfile

# fcov == "fast coverage" by skipping migrations checking.
# // processes ( need + package pytest-xdist)
# Save that for CI.(here processes: N==2)
.PHONY:fcov
fcov:
	@echo "Running fast coverage check"
	@pytest --cov=dump -n 2 --dist loadfile -q

# pip-tools commands
.PHONY:dev
dev:
	pip-compile reqs/dev.in

.PHONY: req-compile
req:
	pip-compile reqs/req.in