# Makefile for deploying Flutter web app to GitHub Pages

# Update These Variables
BASE_HREF = '/car-adds-app/'
GITHUB_REPO = https://github.com/mohammednajy/car-adds-app.git
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

deploy-web:
	@echo "Clean existing repository..."
	flutter clean

	@echo "Getting packages..."
	flutter pub get

	@echo "Building for web..."
	flutter build web --base-href $(BASE_HREF) --release

	@echo "Creating CNAME file..."
	echo "$(CUSTOM_DOMAIN)" > build/web/CNAME

	@echo "Deploying to git repository"
	cd build/web && \
	git init && \
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git branch -M master && \
	git remote add origin $(GITHUB_REPO) && \
	git push -u --force origin master

	cd ../..
	@echo "🟢 Finished Deploy"

.PHONY: deploy-web