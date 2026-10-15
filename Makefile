.DEFAULT_GOAL := help
.PHONY: help bootstrap lint check

help: ## Visa tillgängliga mål
	@grep -E '^[a-z_-]+:.*## ' $(MAKEFILE_LIST) | awk -F':.*## ' '{printf "  %-12s %s\n", $$1, $$2}'

bootstrap: ## Installera beroenden exakt enligt uv.lock
	uv sync --locked

lint: ## Ruff: lintregler och formatkontroll (ändrar inget)
	uv run ruff check .
	uv run ruff format --check .

check: lint ## Allt som CI kör